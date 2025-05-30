🚀 CI/CD Pipeline with GitHub Actions & Docker

This project demonstrates a simple yet powerful CI/CD pipeline using GitHub Actions, Docker, and GitHub Releases. It automates:

    Building a Docker image from code

    Tagging and pushing it to Docker Hub

    Creating a GitHub Release on version tag push

📁 Project Structure

```
📦 .
├─ .github\
│  └─ workflows\
│     └─ ci.yml 
├─ Dockerfile
├─ app.js
├─ package.json
├─ redeploy.sh
└─ README.md
```

⚙️ How It Works
🔨 On Push to master:

    Builds Docker image

    Pushes it to Docker Hub as latest

🏷️ On Tag Push (v1.0.0, etc.):

    Builds Docker image

    Tags and pushes it as v1.0.0

    Creates a GitHub Release with the version info

🔐 GitHub Secrets Required

| Secret Name           | Description                                                                     |
| --------------------- | ------------------------------------------------------------------------------- |
| `DOCKER_USERNAME`     | Your Docker Hub username                                                        |
| `DOCKER_PASSWORD`     | Docker Hub password or access token                                             |
| `GH_PAT` *(optional)* | GitHub Personal Access Token (only needed if `GITHUB_TOKEN` fails for releases) |


🚀 Usage
🧪 Run Locally (after pulling image from Docker Hub)
```
docker pull <your-docker-username>/ci-cd-demo:latest
docker run -d -p 3000:3000 --name my-ci-cd-app <your-docker-username>/ci-cd-demo:latest
```

🔁 redeploy.sh – One-Click Container Update

```The redeploy.sh script automates stopping the old container, pulling the latest image, and running the updated container.```

📜 Script Contents:

```
#!/bin/bash 

CONTAINER_NAME="my-ci-cd-app"
IMAGE_NAME="imumesh/ci-cd-demo"

echo "Stopping old container (if any)..."
docker stop $CONTAINER_NAME 2>/dev/null || true

echo "Removing old container (if any)..."
docker rm $CONTAINER_NAME 2>/dev/null || true

echo "Pulling latest image..."
docker pull $IMAGE_NAME

echo "Running new container..."
docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME
```

▶️ How to Use:
```
chmod +x redeploy.sh   # Make it executable (first time only)
./redeploy.sh          # Run it
```

This ensures your local container always runs the latest deployed image from DockerHub with zero hassle.

🧹 To stop and remove:
``` docker stop my-ci-cd-app && docker rm my-ci-cd-app ```

🔄 CI Workflow File (.github/workflows/ci.yml)
Includes:

    Docker login

    Version detection (latest or tag)

    Build + tag Docker image

    Push both latest and version tag

    GitHub Release trigger

    View the full workflow file in .github/workflows/ci.yml.

🏁 Release Example
When you push a tag:
```
git tag v1.0.1
git push origin v1.0.1
```

➡️ This will:

    Build and push :v1.0.1 image to DockerHub

    Create a GitHub Release named v1.0.1 with info

📦 DockerHub

Check your image at:

``` https://hub.docker.com/r/<your-docker-username>/ci-cd-demo ```


