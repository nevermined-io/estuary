[![banner](https://raw.githubusercontent.com/nevermined-io/assets/main/images/logo/banner_logo.png)](https://nevermined.io)

# Estuary

> Dockerfiles for [estuary](https://github.com/application-research/estuary)

### Getting started

The docker image contains a pre-initialized account with Auth token

- `ESTaa43688b-4ccf-4dad-8a16-410e488706ffARY`

```bash
docker run -p 3004:3004 neverminedio/estuary:latest

curl -X POST http://localhost:3004/content/add -H "Authorization: Bearer ESTaa43688b-4ccf-4dad-8a16-410e488706ffARY" -H "Accept: application/json" -H "Content-Type: multipart/form-data" -F "data=@Dockerfile"
curl -X GET -H "Authorization: Bearer ESTaa43688b-4ccf-4dad-8a16-410e488706ffARY" http://localhost:3004/content/list
```
