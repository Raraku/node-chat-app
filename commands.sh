docker build . -t okta-k8-app

docker run --env-file .env -p 3000:3000 okta-k8-app


aws ecr-public create-repository --repository-name okta-k8-ecr-repo --tags Key=environment,Value=development --region us-east-1


docker tag okta-k8-app:latest <REPOSITORY_URI>:latest


aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws


docker push <REPOSITORY_URI>


eksctl create cluster --name okta-k8-cluster --region <AWS_REGION>

aws eks --region us-east-2 update-kubeconfig --name okta-k8-cluster
