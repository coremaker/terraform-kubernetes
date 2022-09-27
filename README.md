[![Maintained by coremaker.io](https://img.shields.io/badge/maintained%20by-coremaker.io-green)](https://coremaker.io/)

# Terraform Kubernetes Module

This repository contains a [`terraform`] module for running the main operators inside our [`kubernetes`] clusters.
Works best if used with our [`terraform-google-module`]!

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | 2.6.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.anthos_cpr](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cert_manager](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.cert_manager_lentsencrypt](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.flux](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.fluxv2](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.fluxv2_controllers](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.helm_operator](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.istio_egressgateway](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.istio_ingressgateway](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.sealed_secrets](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.anthos](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.cert_manager](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.flux](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.fluxv2](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.k8s_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.sealed_secrets](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.cert_manager_service_key](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.flux_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.fluxv2_gcr_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.fluxv2_github_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_secret.sealed_secrets_tls](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |
| [kubernetes_storage_class.ssd](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/storage_class) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_anthos_channel"></a> [anthos\_channel](#input\_anthos\_channel) | Anthos channel to be used when creating the CPR | `string` | `"stable"` | no |
| <a name="input_anthos_cni_enabled"></a> [anthos\_cni\_enabled](#input\_anthos\_cni\_enabled) | Enable/Disable CNI for Anthos | `string` | `"true"` | no |
| <a name="input_anthos_cpr_name"></a> [anthos\_cpr\_name](#input\_anthos\_cpr\_name) | Name to be used when creating the anthos control plane revision | `string` | `"asm-managed-stable"` | no |
| <a name="input_anthos_enabled"></a> [anthos\_enabled](#input\_anthos\_enabled) | Enable/Disable Anthos resources. | `bool` | `false` | no |
| <a name="input_anthos_namespace"></a> [anthos\_namespace](#input\_anthos\_namespace) | Namespace where to create the Anthos resources. | `string` | `"istio-system"` | no |
| <a name="input_anthos_service_type"></a> [anthos\_service\_type](#input\_anthos\_service\_type) | Anthos service type | `string` | `"managed_service"` | no |
| <a name="input_anthos_vpcsc_enabled"></a> [anthos\_vpcsc\_enabled](#input\_anthos\_vpcsc\_enabled) | Enable/Disable VPCSC for Anthos | `string` | `"false"` | no |
| <a name="input_cert_manager_clouddns_project_id"></a> [cert\_manager\_clouddns\_project\_id](#input\_cert\_manager\_clouddns\_project\_id) | Project id to be used by the cluster issuer. | `string` | `""` | no |
| <a name="input_cert_manager_enabled"></a> [cert\_manager\_enabled](#input\_cert\_manager\_enabled) | Enable/Disable cert-manager operator. | `bool` | `true` | no |
| <a name="input_cert_manager_helm_version"></a> [cert\_manager\_helm\_version](#input\_cert\_manager\_helm\_version) | The helm-chart version to be used. | `string` | `"v1.7.2"` | no |
| <a name="input_cert_manager_service_key"></a> [cert\_manager\_service\_key](#input\_cert\_manager\_service\_key) | Service account key with the right permissions for DNS to be used by cert-manager. | `string` | `""` | no |
| <a name="input_egressgateway_enabled"></a> [egressgateway\_enabled](#input\_egressgateway\_enabled) | Enable/Disable Egress Gateway resource. | `bool` | `false` | no |
| <a name="input_egressgateway_name"></a> [egressgateway\_name](#input\_egressgateway\_name) | Name to be used when creating the istio egress gateway. | `string` | `"istio-egressgateway"` | no |
| <a name="input_egressgateway_values"></a> [egressgateway\_values](#input\_egressgateway\_values) | Values to be set on the egress gateway resource. | <pre>list(object({<br>    name  = any<br>    value = any<br>  }))</pre> | <pre>[<br>  {<br>    "name": "",<br>    "value": ""<br>  }<br>]</pre> | no |
| <a name="input_egressgateway_version"></a> [egressgateway\_version](#input\_egressgateway\_version) | Istio egress gateway chart version. | `string` | `"1.14.3"` | no |
| <a name="input_flux_chart_version"></a> [flux\_chart\_version](#input\_flux\_chart\_version) | Helm chart version to deploy. | `string` | `"1.6.0"` | no |
| <a name="input_flux_enabled"></a> [flux\_enabled](#input\_flux\_enabled) | Enable/Disable flux operator. | `bool` | `false` | no |
| <a name="input_flux_git_path"></a> [flux\_git\_path](#input\_flux\_git\_path) | Github repository path to be used. | `string` | `"environments/dev"` | no |
| <a name="input_flux_git_url"></a> [flux\_git\_url](#input\_flux\_git\_url) | Github SSH url to the repository holding kubernetes manifests. | `string` | `""` | no |
| <a name="input_flux_manifest_generation"></a> [flux\_manifest\_generation](#input\_flux\_manifest\_generation) | Enable/Disable manifests. | `bool` | `true` | no |
| <a name="input_flux_private_key_pem"></a> [flux\_private\_key\_pem](#input\_flux\_private\_key\_pem) | Private key to be used for github integration. | `string` | `""` | no |
| <a name="input_flux_version"></a> [flux\_version](#input\_flux\_version) | Application version to deploy. | `string` | `"1.21.0"` | no |
| <a name="input_fluxv2_chart"></a> [fluxv2\_chart](#input\_fluxv2\_chart) | Helm chart to be used to deploy fluxv2. | `string` | `"https://github.com/coremaker/helm-chart-fluxv2/releases/download/v0.0.9/fluxv2-0.0.9.tgz"` | no |
| <a name="input_fluxv2_enabled"></a> [fluxv2\_enabled](#input\_fluxv2\_enabled) | Enable/Disable fluxv2 operator. | `bool` | `false` | no |
| <a name="input_fluxv2_gcr_service_key"></a> [fluxv2\_gcr\_service\_key](#input\_fluxv2\_gcr\_service\_key) | Service account key with the right permissions for GCR to be used by fluxv2. | `string` | `""` | no |
| <a name="input_fluxv2_git_branch"></a> [fluxv2\_git\_branch](#input\_fluxv2\_git\_branch) | Github branch to be used. | `string` | `"main"` | no |
| <a name="input_fluxv2_git_path"></a> [fluxv2\_git\_path](#input\_fluxv2\_git\_path) | Github repository path to be used. | `string` | `""` | no |
| <a name="input_fluxv2_git_repository_interval"></a> [fluxv2\_git\_repository\_interval](#input\_fluxv2\_git\_repository\_interval) | Fluxv2 gitrepository resource sync interval. | `string` | `"5m"` | no |
| <a name="input_fluxv2_git_url"></a> [fluxv2\_git\_url](#input\_fluxv2\_git\_url) | Github SSH url to the repository holding kubernetes manifests. | `string` | `""` | no |
| <a name="input_fluxv2_image_automation_checkout_branch"></a> [fluxv2\_image\_automation\_checkout\_branch](#input\_fluxv2\_image\_automation\_checkout\_branch) | Branch holding the versions to be used for deployments. | `string` | `"main"` | no |
| <a name="input_fluxv2_image_automation_interval"></a> [fluxv2\_image\_automation\_interval](#input\_fluxv2\_image\_automation\_interval) | Fluxv2 image automation resource sync interval. | `string` | `"5m"` | no |
| <a name="input_fluxv2_image_automation_push_branch"></a> [fluxv2\_image\_automation\_push\_branch](#input\_fluxv2\_image\_automation\_push\_branch) | Branch where to push new versions for deployments. | `string` | `"main"` | no |
| <a name="input_fluxv2_image_automation_suspend"></a> [fluxv2\_image\_automation\_suspend](#input\_fluxv2\_image\_automation\_suspend) | Suspend image automation resource. | `bool` | `false` | no |
| <a name="input_fluxv2_kustomization_interval"></a> [fluxv2\_kustomization\_interval](#input\_fluxv2\_kustomization\_interval) | Fluxv2 kustomization resource sync interval. | `string` | `"5m"` | no |
| <a name="input_fluxv2_kustomization_prune"></a> [fluxv2\_kustomization\_prune](#input\_fluxv2\_kustomization\_prune) | Enable/Disable prune for all resources. | `bool` | `true` | no |
| <a name="input_fluxv2_private_key_pem"></a> [fluxv2\_private\_key\_pem](#input\_fluxv2\_private\_key\_pem) | Private key to be used for github integration. | `any` | `""` | no |
| <a name="input_fluxv2_public_key_pem"></a> [fluxv2\_public\_key\_pem](#input\_fluxv2\_public\_key\_pem) | Public key to be used for github integration. | `any` | `""` | no |
| <a name="input_fluxv2_resources_name"></a> [fluxv2\_resources\_name](#input\_fluxv2\_resources\_name) | The name of the main fluxv2 resources. | `string` | `"k8s-repo"` | no |
| <a name="input_helm_operator"></a> [helm\_operator](#input\_helm\_operator) | Application version do deploy. | `string` | `"1.2.0"` | no |
| <a name="input_helm_operator_chart_version"></a> [helm\_operator\_chart\_version](#input\_helm\_operator\_chart\_version) | Helm chart version to deploy. | `string` | `"1.2.0"` | no |
| <a name="input_ingressgateway_enabled"></a> [ingressgateway\_enabled](#input\_ingressgateway\_enabled) | Enable/Disable Egress Gateway resource. | `bool` | `false` | no |
| <a name="input_ingressgateway_name"></a> [ingressgateway\_name](#input\_ingressgateway\_name) | Name to be used when creating the istio ingress gateway. | `string` | `"istio-ingressgateway"` | no |
| <a name="input_ingressgateway_values"></a> [ingressgateway\_values](#input\_ingressgateway\_values) | Values to be set on the ingress gateway resource. | <pre>list(object({<br>    name  = any<br>    value = any<br>  }))</pre> | <pre>[<br>  {<br>    "name": "",<br>    "value": ""<br>  }<br>]</pre> | no |
| <a name="input_ingressgateway_version"></a> [ingressgateway\_version](#input\_ingressgateway\_version) | Istio ingress gateway chart version. | `string` | `"1.14.3"` | no |
| <a name="input_istio_gateways_namespace"></a> [istio\_gateways\_namespace](#input\_istio\_gateways\_namespace) | Namespace where to create the istio gateways. | `string` | `"istio-ingress"` | no |
| <a name="input_k8s_namespaces"></a> [k8s\_namespaces](#input\_k8s\_namespaces) | Namespaces to be created. | <pre>list(object({<br>    name        = string<br>    labels      = optional(map(string))<br>    annotations = optional(map(string))<br>  }))</pre> | n/a | yes |
| <a name="input_sealed_secrets_cert_pem"></a> [sealed\_secrets\_cert\_pem](#input\_sealed\_secrets\_cert\_pem) | Self-signed cert to be used for the encryption/decryption of secrets. | `string` | `""` | no |
| <a name="input_sealed_secrets_chart_version"></a> [sealed\_secrets\_chart\_version](#input\_sealed\_secrets\_chart\_version) | Helm chart version to deploy. | `string` | `"1.0.8"` | no |
| <a name="input_sealed_secrets_enabled"></a> [sealed\_secrets\_enabled](#input\_sealed\_secrets\_enabled) | Enable/Disable sealed-secrets operator. | `bool` | `true` | no |
| <a name="input_sealed_secrets_private_key"></a> [sealed\_secrets\_private\_key](#input\_sealed\_secrets\_private\_key) | Private key used for the encryption of secrets. | `string` | `""` | no |
| <a name="input_sealed_secrets_version"></a> [sealed\_secrets\_version](#input\_sealed\_secrets\_version) | Application version do deploy. | `string` | `"0.18.0"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

# Flux - Fluxv2

Continuous delivery is a term that encapsulates a set of best practices that surround building, deploying and monitoring applications. The goal is to provide a sustainable model for maintaining and improving an application.

Flux is a tool that automates the deployment of containers to Kubernetes. It fills the automation void that exists between building and monitoring

Flux’s main feature is the automated synchronisation between a version control repository and a cluster. If you make any changes to your repository, those changes are automatically deployed to your cluster.

More information about [`flux`].

# Sealed-secrets

Encrypt your Secret into a SealedSecret, which is safe to store - even to a public repository. The SealedSecret can be decrypted only by the controller running in the target cluster and nobody else (not even the original author) is able to obtain the original Secret from the SealedSecret.

The certificates are stored in sealedsecret-keys folder, every k8s cluster has its own certificate with which its decrypting the secrets. The secret has to be resealed in every environment for sealed-secret to be able to decrypt it.

More information about [`sealed-secrets`].

# Cert-Manager

Cert-manager adds certificates and certificate issuers as resource types in Kubernetes clusters, and simplifies the process of obtaining, renewing and using those certificates.

It will ensure certificates are valid and up to date, and attempt to renew certificates at a configured time before expiry.

More information about [`cert-manager`].

[`terraform-google-module`]: https://github.com/coremaker/terraform-google-nucleus
[`kubernetes`]: https://kubernetes.io/
[`terraform`]: https://www.terraform.io
[`sealed-secrets`]: https://github.com/bitnami-labs/sealed-secrets
[`flux`]: https://docs.fluxcd.io/en/1.18.0/introduction.html
[`cert-manager`]: https://cert-manager.io/docs/
