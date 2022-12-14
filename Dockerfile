FROM golang:1.18 as build
WORKDIR /estuary

# install estuary dependencies
RUN apt-get update && \
    apt-get install -y hwloc libhwloc-dev jq ocl-icd-opencl-dev

# install rust
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

RUN cargo --help
RUN git clone --single-branch --branch v0.3.0 https://github.com/application-research/estuary .
RUN make clean all

FROM ubuntu:latest
WORKDIR /estuary

# Install estuary dependencies
RUN apt-get update && apt-get install -y \
    hwloc \
    libhwloc-dev \
    ocl-icd-opencl-dev \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Pre-initialized db with ESTUARY_TOKEN=ESTaa43688b-4ccf-4dad-8a16-410e488706ffARY
COPY estuary.db .
COPY --from=build /estuary/estuary .

EXPOSE 3004
ENV FULLNODE_API_INFO=wss://api.chain.love

CMD ./estuary