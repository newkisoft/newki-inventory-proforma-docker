sudo docker stop $(sudo docker ps -aq -f name=inventory-proforma)
sudo docker rm $(sudo docker ps -aq -f name=inventory-proforma) 
#sudo docker rmi newki/inventory-proforma:1.1 
sudo docker run --name inventory-proforma --network host -i -d newki/inventory-features:1.1 
sudo docker exec -w / inventory-proforma git clone https://github.com/newkisoft/newki-inventory-proforma-publish.git
sudo docker exec -d -w /newki-inventory-proforma-publish/ inventory-proforma cp appsettings.live.json appsettings.json
sudo docker exec -d -w /newki-inventory-proforma-publish/ inventory-proforma dotnet newki-inventory-proforma.dll 


