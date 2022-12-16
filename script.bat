echo "Criando as imagens backend e banco......."

docker build -t almeidadaniel/projeto-backend:1.0 backend/.
docker build -t almeidadaniel/projeto-database:1.0 database/.

echo "Realizando o push das imagens......."

docker push almeidadaniel/projeto-backend:1.0
docker push almeidadaniel/projeto-database:1.0

echo "Criando serviços no cluster kubernetes......."

kubectl apply -f ./services.yml

echo "Criando os Deployments......."

kubectl apply -f ./deployment.yml