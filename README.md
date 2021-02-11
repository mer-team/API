## merApi
This NodeJS microservice is responsible for the backend API

### Port
This microservice is exposed on port `8000`

### Docker Params
| Arg | Default | Description |
| --- | --- | --- |
| DB_HOST | localhost | Database hostname|
| DB_USERNAME | root | Database Username |
| DB_PASSWORD | teste | Database password  |
| DB_DATABASE | mer | Database name |

### Seeding
```
npx sequelize-cli db:migrate
npx sequelize-cli db:seed:all
```