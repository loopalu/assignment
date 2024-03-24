# Simple Spring Boot and React Application

This project is a simple Spring Boot and React application made for an assignment. It includes a backend built with 
Spring Boot and a frontend built with React.

## Getting Started

### Prerequisites

Before running the application, ensure you have the following installed:

- Java 17
- Node.js 20.11.1
- npm 10.5.0
- PostgreSQL (ensure the service is locally running and accessible)

### Configuration

Database credentials are defined in `application.yml` within `src/main/resources` directory.

## Running the Application


For starting the application run the following command inside project's root directory. This will start the Spring Boot 
application and also build and package the React application. The first run might take a bit longer time.

```shell
./gradlew clean bootRun
```

## Running the Tests

1\. **Unit Tests**

For running unit tests, use the following command:
```shell
./gradlew test
```
2\. **Integration Tests**

For running integration tests, use the following command:
```shell
./gradlew integrationTest
```
3\. **Frontend Tests**

For running frontend tests, use the following command inside `frontend` directory:
```shell
npm test
```