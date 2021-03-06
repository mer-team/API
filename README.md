## merApi
This NodeJS microservice is responsible for the backend API. When a user sends an URL to process, the api creates a message to the message queue `musicExtraction` with the music URL.

### Port
This microservice is exposed on port `8000`

### Docker Params
| Arg | Default | Description |
| --- | --- | --- |
| DB_HOST | localhost | Database hostname|
| DB_USERNAME | root | Database username |
| DB_PASSWORD | teste | Database password  |
| DB_DATABASE | mer | Database name |
| MQ_HOST | localhost | RabbitMQ hostname|
| MQ_USERNAME | guest | RabbitMQ username |
| MQ_PASSWORD | teste | RabbitMQ password  |

### Seeding
```
npx sequelize-cli db:migrate
npx sequelize-cli db:seed:all
```

### Docker Build
Run Rabbit
```
docker run -d -e RABBITMQ_DEFAULT_USER=merUser -e RABBITMQ_DEFAULT_PASS=passwordMER -p 15672:15672 -p 5672:5672 rabbitmq:3-management-alpine
```

Run PostgreSQL
```
docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=teste -e POSTGRES_USER=root -e POSTGRES_DB=mer postgres:13-alpine
```

Build local `api` from source
```
docker build -t api:local .
```

Run local `api`
```
docker run -e DB_HOST=localhost -e DB_USERNAME=root -e DB_PASSWORD=teste -e DB_DATABASE=mer -e MQ_HOST=localhost -e MQ_USER=merUser -e MQ_PASS=passwordMER --net=host api:local
```

Run official `api` image locally
```
docker run -e DB_HOST=db -e DB_USERNAME=root -e DB_PASSWORD=teste -e DB_DATABASE=mer -e MQ_HOST=rabbit -e MQ_USER=merUser -e MQ_PASS=passwordMER --net=host merteam/api:latest
```

### Tests
The tests are based on `jest` and testing the login