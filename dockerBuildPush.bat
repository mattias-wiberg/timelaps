docker build -t 192.168.10.153:32000/timelaps-service:latest ./timelaps-service
docker build --build-arg VITE_API_BASE_URL=http://192.168.10.153/api -t 192.168.10.153:32000/camera-frontend:latest ./camera-frontend
docker build --build-arg VITE_API_BASE_URL=http://192.168.10.153/api -t 192.168.10.153:32000/timelaps-frontend:latest ./timelaps-frontend
docker push 192.168.10.153:32000/timelaps-service:latest
docker push 192.168.10.153:32000/camera-frontend:latest
docker push 192.168.10.153:32000/timelaps-frontend:latest