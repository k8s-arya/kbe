cat <<EOF >signing-request.yaml
apiVersion: certificates.k8s.io/v1
kind: CertificateSigningRequest
metadata:
  name: ravi-csr
spec:
  groups:
  - system:authenticated
  request: ${CSR}
  signerName: kubernetes.io/kube-apiserver-client
  usages:
  - client auth
EOF
