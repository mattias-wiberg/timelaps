docker build -t 192.168.10.153:32000/timelaps-service:latest ./timelaps-service
docker push 192.168.10.153:32000/timelaps-service:latest
docker build --build-arg VITE_API_BASE_URL=https://84.217.51.153/api -t 192.168.10.153:32000/camera-frontend:latest ./camera-frontend
docker push 192.168.10.153:32000/camera-frontend:latest
docker build --build-arg VITE_API_BASE_URL=https://84.217.51.153/api -t 192.168.10.153:32000/timelaps-frontend:latest ./timelaps-frontend
docker push 192.168.10.153:32000/timelaps-frontend:latest