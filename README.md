[![Massdriver][logo]][website]

# azure-event-hubs

[![Release][release_shield]][release_url]
[![Contributors][contributors_shield]][contributors_url]
[![Forks][forks_shield]][forks_url]
[![Stargazers][stars_shield]][stars_url]
[![Issues][issues_shield]][issues_url]
[![MIT License][license_shield]][license_url]

Event Hubs is a modern big data streaming platform and event ingestion service that can seamlessly integrate with other Azure and Microsoft services. The service can process millions of events per second with low latency. The data sent to an event hub (Event Hubs instance) can be transformed and stored by using any real-time analytics providers or batching or storage adapters.

---

## Design

For detailed information, check out our [Operator Guide](operator.mdx) for this bundle.

## Usage

Our bundles aren't intended to be used locally, outside of testing. Instead, our bundles are designed to be configured, connected, deployed and monitored in the [Massdriver][website] platform.

### What are Bundles?

Bundles are the basic building blocks of infrastructure, applications, and architectures in [Massdriver][website]. Read more [here](https://docs.massdriver.cloud/concepts/bundles).

## Bundle

<!-- COMPLIANCE:START -->

Security and compliance scanning of our bundles is performed using [Bridgecrew](https://www.bridgecrew.cloud/). Massdriver also offers security and compliance scanning of operational infrastructure configured and deployed using the platform.

| Benchmark                                                                                                                                                                                                                                                       | Description                        |
| --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------- |
| [![Infrastructure Security](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-event-hubs/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-event-hubs&benchmark=INFRASTRUCTURE+SECURITY) | Infrastructure Security Compliance |
| [![CIS AZURE](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-event-hubs/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-event-hubs&benchmark=CIS+AZURE+V1.1) | Center for Internet Security, AZURE Compliance |
| [![PCI-DSS](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-event-hubs/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-event-hubs&benchmark=PCI-DSS+V3.2) | Payment Card Industry Data Security Standards Compliance |
| [![NIST-800-53](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-event-hubs/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-event-hubs&benchmark=NIST-800-53) | National Institute of Standards and Technology Compliance |
| [![ISO27001](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-event-hubs/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-event-hubs&benchmark=ISO27001) | Information Security Management System, ISO/IEC 27001 Compliance |
| [![SOC2](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-event-hubs/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-event-hubs&benchmark=SOC2)| Service Organization Control 2 Compliance |
| [![HIPAA](https://www.bridgecrew.cloud/badges/github/massdriver-cloud/azure-event-hubs/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=massdriver-cloud%2Fazure-event-hubs&benchmark=HIPAA) | Health Insurance Portability and Accountability Compliance |

<!-- COMPLIANCE:END -->

### Params

Form input parameters for configuring a bundle for deployment.

<details>
<summary>View</summary>

<!-- PARAMS:START -->
## Properties

- **`capture`** *(object)*
  - **`arvo_encoding`** *(string)*: Specifies the encoding used for the capture. Must be one of: `['Avro', 'AvroDeflate']`. Default: `Avro`.
  - **`capture_buildup`** *(integer)*: The amount of data built up in your Event Hub before a capture operation occurs. Minimum of 10 MiB, maximum of 500 MiB. Minimum: `10`. Maximum: `500`. Default: `300`.
  - **`capture_interval`** *(integer)*: The time interval, in seconds, at which the capture to Azure Data Lake will happen. Minimum of 60, maximum of 900. Minimum: `60`. Maximum: `900`. Default: `300`.
- **`hub`** *(object)*
  - **`message_retention`** *(integer)*: The number of days to retain the events for this Event Hubs, value should be 1 to 7 days. Minimum: `1`. Maximum: `7`. Default: `1`.
  - **`partition_count`** *(integer)*: Minimum: `1`. Maximum: `32`. Default: `1`.
  - **`sku`** *(string)*: Learn more about the different features and capabilities of each pricing tier [here](https://learn.microsoft.com/en-us/azure/event-hubs/compare-tiers). **Cannot be changed after deployment**. Must be one of: `['Standard', 'Premium']`. Default: `Standard`.
  - **`throughput_units`** *(integer)*: The number of throughput units allocated for the Event Hubs. Minimum of 1, maximum of 40. [Learn more here](https://learn.microsoft.com/en-us/azure/event-hubs/event-hubs-scalability#throughput-units). Minimum: `1`. Maximum: `40`.
  - **`zone_redundant`** *(boolean)*: Enable zone redundancy for the Event Hubs. **Cannot be changed after deployment**. Default: `False`.
- **`monitoring`** *(object)*
  - **`mode`** *(string)*: Enable and customize Function App metric alarms. Default: `AUTOMATED`.
    - **One of**
      - Automated
      - Custom
      - Disabled
## Examples

  ```json
  {
      "__name": "Development",
      "hub": {
          "partition_count": 1,
          "sku": "Standard",
          "throughput_units": 1
      }
  }
  ```

  ```json
  {
      "__name": "Production",
      "hub": {
          "message_retention": 7,
          "partition_count": 20,
          "sku": "Premium",
          "throughput_units": 10
      }
  }
  ```

<!-- PARAMS:END -->

</details>

### Connections

Connections from other bundles that this bundle depends on.

<details>
<summary>View</summary>

<!-- CONNECTIONS:START -->
## Properties

- **`azure_service_principal`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`client_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

    - **`client_secret`** *(string)*
    - **`subscription_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

    - **`tenant_id`** *(string)*: A valid UUID field.

      Examples:
      ```json
      "123xyz99-ab34-56cd-e7f8-456abc1q2w3e"
      ```

  - **`specs`** *(object)*
- **`azure_storage_account_blob`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`infrastructure`** *(object)*
      - **`ari`** *(string)*: Azure Resource ID.

        Examples:
        ```json
        "/subscriptions/12345678-1234-1234-abcd-1234567890ab/resourceGroups/resource-group-name/providers/Microsoft.Network/virtualNetworks/network-name"
        ```

      - **`endpoint`** *(string)*: Azure Storage Account endpoint authentication. Cannot contain additional properties.

        Examples:
        ```json
        "https://storageaccount.blob.core.windows.net/"
        ```

        ```json
        "http://storageaccount.file.core.windows.net"
        ```

        ```json
        "abfs://filesystem.accountname.dfs.core.windows.net/"
        ```

        ```json
        "https://storageaccount.privatelink01.queue.core.windows.net/"
        ```

    - **`security`** *(object)*: Azure Security Configuration. Cannot contain additional properties.
      - **`iam`** *(object)*: IAM Roles And Scopes. Cannot contain additional properties.
        - **`^[a-z]+[a-z_]*[a-z]$`** *(object)*
          - **`role`**: Azure Role.

            Examples:
            ```json
            "Storage Blob Data Reader"
            ```

          - **`scope`** *(string)*: Azure IAM Scope.
  - **`specs`** *(object)*
    - **`azure`** *(object)*: .
      - **`region`** *(string)*: Select the Azure region you'd like to provision your resources in.
<!-- CONNECTIONS:END -->

</details>

### Artifacts

Resources created by this bundle that can be connected to other bundles.

<details>
<summary>View</summary>

<!-- ARTIFACTS:START -->
## Properties

- **`azure_event_hubs`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`infrastructure`** *(object)*
      - **`ari`** *(string)*: Azure Resource ID.

        Examples:
        ```json
        "/subscriptions/12345678-1234-1234-abcd-1234567890ab/resourceGroups/resource-group-name/providers/Microsoft.Network/virtualNetworks/network-name"
        ```

      - **`endpoint`** *(string)*: Azure Event Hubs endpoint authentication. Cannot contain additional properties.

        Examples:
        ```json
        "sb://eventhub.servicebus.windows.net/"
        ```

    - **`security`** *(object)*: Azure Security Configuration. Cannot contain additional properties.
      - **`iam`** *(object)*: IAM Roles And Scopes. Cannot contain additional properties.
        - **`^[a-z]+[a-z_]*[a-z]$`** *(object)*
          - **`role`**: Azure Role.

            Examples:
            ```json
            "Storage Blob Data Reader"
            ```

          - **`scope`** *(string)*: Azure IAM Scope.
  - **`specs`** *(object)*
    - **`azure`** *(object)*: .
      - **`region`** *(string)*: Select the Azure region you'd like to provision your resources in.
<!-- ARTIFACTS:END -->

</details>

## Contributing

<!-- CONTRIBUTING:START -->

### Bug Reports & Feature Requests

Did we miss something? Please [submit an issue](https://github.com/massdriver-cloud/azure-event-hubs/issues) to report any bugs or request additional features.

### Developing

**Note**: Massdriver bundles are intended to be tightly use-case scoped, intention-based, reusable pieces of IaC for use in the [Massdriver][website] platform. For this reason, major feature additions that broaden the scope of an existing bundle are likely to be rejected by the community.

Still want to get involved? First check out our [contribution guidelines](https://docs.massdriver.cloud/bundles/contributing).

### Fix or Fork

If your use-case isn't covered by this bundle, you can still get involved! Massdriver is designed to be an extensible platform. Fork this bundle, or [create your own bundle from scratch](https://docs.massdriver.cloud/bundles/development)!

<!-- CONTRIBUTING:END -->

## Connect

<!-- CONNECT:START -->

Questions? Concerns? Adulations? We'd love to hear from you!

Please connect with us!

[![Email][email_shield]][email_url]
[![GitHub][github_shield]][github_url]
[![LinkedIn][linkedin_shield]][linkedin_url]
[![Twitter][twitter_shield]][twitter_url]
[![YouTube][youtube_shield]][youtube_url]
[![Reddit][reddit_shield]][reddit_url]


<!-- markdownlint-disable -->

[logo]: https://raw.githubusercontent.com/massdriver-cloud/docs/main/static/img/logo-with-logotype-horizontal-400x110.svg

[docs]: https://docs.massdriver.cloud?utm_source=azure-event-hubs&utm_medium=azure-event-hubs&utm_campaign=azure-event-hubs&utm_content=azure-event-hubs
[website]: https://www.massdriver.cloud?utm_source=azure-event-hubs&utm_medium=azure-event-hubs&utm_campaign=azure-event-hubs&utm_content=azure-event-hubs
[github]: https://github.com/massdriver-cloud
[linkedin]: https://www.linkedin.com/company/massdriver/

[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/azure-event-hubs.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/azure-event-hubs/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/azure-event-hubs.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/azure-event-hubs/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/azure-event-hubs.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/azure-event-hubs/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/azure-event-hubs.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/azure-event-hubs/issues
[release_url]: https://github.com/massdriver-cloud/azure-event-hubs/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/azure-event-hubs.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/azure-event-hubs.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/azure-event-hubs/blob/main/LICENSE

[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2
[twitter_url]: https://twitter.com/massdriver
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
