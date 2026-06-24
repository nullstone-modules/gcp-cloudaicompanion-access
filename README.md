# gcp-cloudaicompanion-access

Grants a GCP app's service account access to [Cloud AI Companion](https://cloud.google.com/gemini/docs/api/overview)
(the API behind Gemini for Google Cloud / Gemini Code Assist).

This is a Nullstone capability module. When attached to an app, it reads the app's service account from
`app_metadata` and binds the requested predefined `roles/cloudaicompanion.*` roles to it at the project level.

## Usage

Configure the `access` variable with the role suffixes you want to grant. Each item is interpolated as
`roles/cloudaicompanion.<item>`.

```hcl
access = ["user", "viewer"]
```

## Roles

| `access` value                 | Role                                                 | Description                                                        |
|--------------------------------|------------------------------------------------------|-------------------------------------------------------------------|
| `admin`                        | `roles/cloudaicompanion.admin`                       | Full administrative access to Gemini for Google Cloud.            |
| `editor`                       | `roles/cloudaicompanion.editor`                      | Edit access to Gemini for Google Cloud resources.                 |
| `viewer`                       | `roles/cloudaicompanion.viewer`                      | Read-only access to Gemini for Google Cloud.                      |
| `user`                         | `roles/cloudaicompanion.user`                        | Use Gemini for Google Cloud features (chat, code generation/completion). |
| `individualUser`               | `roles/cloudaicompanion.individualUser`              | Use Gemini for Google Cloud features as an individual user.       |
| `settingsAdmin`                | `roles/cloudaicompanion.settingsAdmin`               | Manage Gemini for Google Cloud settings.                          |
| `settingsUser`                 | `roles/cloudaicompanion.settingsUser`                | Read Gemini for Google Cloud settings.                            |
| `codeRepositoryIndexesAdmin`   | `roles/cloudaicompanion.codeRepositoryIndexesAdmin`  | Manage code repository indexes.                                   |
| `codeRepositoryIndexesViewer`  | `roles/cloudaicompanion.codeRepositoryIndexesViewer` | Read-only access to code repository indexes.                      |
| `codeToolsAdmin`               | `roles/cloudaicompanion.codeToolsAdmin`              | Manage Gemini Code Assist tools settings (Beta).                  |
| `codeToolsUser`                | `roles/cloudaicompanion.codeToolsUser`               | Use Gemini Code Assist tools (Beta).                              |
| `repositoryGroupsUser`         | `roles/cloudaicompanion.repositoryGroupsUser`        | Use repository groups within a code repository index.             |
| `topicAdmin`                   | `roles/cloudaicompanion.topicAdmin`                  | Manage Gemini for Google Cloud topics (Beta).                     |
| `topicReader`                  | `roles/cloudaicompanion.topicReader`                 | Read Gemini for Google Cloud topics (Beta).                       |

See the [Gemini for Google Cloud API IAM roles reference](https://cloud.google.com/iam/docs/roles-permissions/cloudaicompanion)
for the full set of permissions associated with each role.

## Inputs

| Name           | Description                                                                                                    | Type           | Default | Required |
|----------------|----------------------------------------------------------------------------------------------------------------|----------------|---------|----------|
| `access`       | A list of Cloud AI Companion role suffixes to grant at the project level.                                      | `list(string)` | n/a     | yes      |
| `app_metadata` | Reserved capability variable. Nullstone injects app metadata (including the service account) into this module. | `map(string)`  | `{}`    | no       |

## Outputs

None.
