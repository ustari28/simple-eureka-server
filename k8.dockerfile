apiVersion: 'apps/v1'
kind: 'deployment'
metadata:
    name: eureka-server
    framework: spring-boot
spec:
    ports:
    - port: 8761
      targetPort: 8761
    selector:
        matchLabels:
            app: eureka
    minReadySeconds: 5
    template:
        metadata:
            labels:
                app: eureka
        spec:
            containers:
            - name: eurela-server
              image: 127.0.0.1:5000/spring-boot/eureka-server:1.0.0
              ports:
              - containerPort: 8761
                protocol: TCP