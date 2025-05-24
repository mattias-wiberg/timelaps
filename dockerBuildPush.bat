docker build -t 192.168.10.153:32000/camera-frontend:latest ./camera-frontend
docker build -t 192.168.10.153:32000/timelaps-frontend:latest ./timelaps-frontend
docker push 192.168.10.153:32000/camera-frontend:latest
docker push 192.168.10.153:32000/timelaps-frontend:latest