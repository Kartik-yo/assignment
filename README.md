# CI/CD Pipeline with GitHub Actions

This repository contains a simple web application and a CI/CD pipeline configured with GitHub Actions to automate the deployment to AWS ECS.

## Setup

1. Clone the repository.
2. Configure the following secrets in your GitHub repository settings:
   - `ECR_REGISTRY`
   - `ECR_REPOSITORY`
   - `ECS_SERVICE`
   - `ECS_CLUSTER`
   - `ECS_TASK_DEFINITION`
   - `CONTAINER_NAME`
3. Push changes to the `main` branch to trigger the CI/CD pipeline.

## Usage

- The pipeline builds and pushes a Docker image to Amazon ECR.
- Deploys the image to Amazon ECS.
- Runs integration tests and rolls back if any test fails.

## Testing

- Ensure your integration tests are defined in the `test` job of the GitHub Actions workflow.

## License

This project is licensed under the MIT License.
