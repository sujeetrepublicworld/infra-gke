# nginx-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  namespace: testargo
spec:
  replicas: 2
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
        - name: nginx
          image: nginx:stable
          ports:
            - containerPort: 80

---
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
  namespace: testargo
spec:
  selector:
    app: nginx
  type: NodePort   # ClusterIP se change kiya
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30080   # browser se access ke liye
