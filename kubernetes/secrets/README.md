# Sealed-Secrets

Official github repo: https://github.com/bitnami-labs/sealed-secrets

## Hyly.AI Workflow

### Controller

Once you deploy the manifest it will create the `SealedSecret` resource
and install the controller into `sealed-secrets` namespace, create a service
account and necessary RBAC roles.

After a few moments, the controller will start, generate a key pair,
and be ready for operation. If it does not, check the controller logs.

#### Helm Chart

Add helm repo for sealed secrets

```bash
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
```

```bash
helm install sealed-secrets -n sealed-secrets --values kubernetes/secrets/sealed-secrets-values.yaml sealed-secrets/sealed-secrets
```

### Kubeseal

#### Homebrew

The `kubeseal` client is also available on [homebrew](https://formulae.brew.sh/formula/kubeseal):

```bash
brew install kubeseal
```

#### Linux

The `kubeseal` client can be installed on Linux, using the below commands:

```bash
KUBESEAL_VERSION='' # Set this to, for example, KUBESEAL_VERSION='0.23.0'
wget "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION:?}/kubeseal-${KUBESEAL_VERSION:?}-linux-amd64.tar.gz"
tar -xvzf kubeseal-${KUBESEAL_VERSION:?}-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
```

If you have `curl` and `jq` installed on your machine, you can get the version dynamically this way. This can be useful for environments used in automation and such.

```
# Fetch the latest sealed-secrets version using GitHub API
KUBESEAL_VERSION=$(curl -s https://api.github.com/repos/bitnami-labs/sealed-secrets/tags | jq -r '.[0].name' | cut -c 2-)

# Check if the version was fetched successfully
if [ -z "$KUBESEAL_VERSION" ]; then
    echo "Failed to fetch the latest KUBESEAL_VERSION"
    exit 1
fi

wget "https://github.com/bitnami-labs/sealed-secrets/releases/download/v${KUBESEAL_VERSION}/kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz"
tar -xvzf kubeseal-${KUBESEAL_VERSION}-linux-amd64.tar.gz kubeseal
sudo install -m 755 kubeseal /usr/local/bin/kubeseal
```

where `KUBESEAL_VERSION` is the [version tag](https://github.com/bitnami-labs/sealed-secrets/tags) of the kubeseal release you want to use. For example: `v0.18.0`.

### Usage

After installing controller, you should now be able to create sealed secrets.

1. Install the client-side tool (kubeseal) as explained in the docs below:

    https://github.com/bitnami-labs/sealed-secrets#installation-from-source

2. Create a sealed secret file running the command below:

    ```bash
    kubectl create secret generic secret-name --dry-run=client --from-literal=foo=bar -o [json|yaml] | \
    kubeseal \
      --controller-name=sealed-secrets-controller \
      --controller-namespace=sealed-secrets \
      --format yaml > mysealedsecret.[json|yaml]
    ```
    The file mysealedsecret.[json|yaml] is a commitable file.

    If you would rather not need access to the cluster to generate the sealed secret you can run:
      ```bash
        kubeseal \
          --controller-name=sealed-secrets-controller \
          --controller-namespace=sealed-secrets \
          --fetch-cert > mycert.pem
      ```

    to retrieve the public cert used for encryption and store it locally. You can then run 'kubeseal --cert mycert.pem' instead to use the local cert e.g.

      ```bash
        kubectl create secret generic secret-name --dry-run=client --from-literal=foo=bar -o [json|yaml] | \
        kubeseal \
          --controller-name=sealed-secrets-controller \
          --controller-namespace=sealed-secrets \
          --format [json|yaml] --cert mycert.pem > mysealedsecret.[json|yaml]

      ```

3. Apply the sealed secret

    ```bash
    kubectl create -f mysealedsecret.[json|yaml]
    ```


Running 'kubectl get secret secret-name -o [json|yaml]' will show the decrypted secret that was generated from the sealed secret.

Both the SealedSecret and generated Secret must have the same name and namespace.