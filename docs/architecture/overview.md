# Overview

## Frontend: React Native App 

```mermaid
flowchart LR
  RN[Native App]<-->|HTTPS/JSON| API[FastAPI]
```

## Frontend: React Native Web


```mermaid
flowchart LR
  RN[Web App]<-->|HTTPS/JSON| API[FastAPI]
```

## Backend: FastAPI

More details [here](./api.md)

```mermaid
flowchart LR
  API <--> DB[(Postgres)]
```