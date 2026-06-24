variable "app_metadata" {
  description = <<EOF
Nullstone automatically injects metadata from the app module into this module through this variable.
This variable is a reserved variable for capabilities.
EOF

  type    = map(string)
  default = {}
}

locals {
  service_account_email = var.app_metadata["service_account_email"]
}

variable "access" {
  description = <<EOF
A list of Cloud AI Companion (Gemini for Google Cloud) roles to grant to the app's service account at
the project level. Each item is interpolated as `roles/cloudaicompanion.<item>`, so provide only the
suffix of the predefined role (e.g. `user`, `viewer`).

Valid values:
  - admin
  - editor
  - viewer
  - user
  - individualUser
  - settingsAdmin
  - settingsUser
  - codeRepositoryIndexesAdmin
  - codeRepositoryIndexesViewer
  - codeToolsAdmin
  - codeToolsUser
  - repositoryGroupsUser
  - topicAdmin
  - topicReader
EOF

  type = list(string)

  validation {
    condition = alltrue([
      for item in var.access : contains([
        "admin",
        "editor",
        "viewer",
        "user",
        "individualUser",
        "settingsAdmin",
        "settingsUser",
        "codeRepositoryIndexesAdmin",
        "codeRepositoryIndexesViewer",
        "codeToolsAdmin",
        "codeToolsUser",
        "repositoryGroupsUser",
        "topicAdmin",
        "topicReader",
      ], item)
    ])
    error_message = "Each item in access must be a valid Cloud AI Companion role suffix (interpolated as roles/cloudaicompanion.<item>). Valid values: admin, editor, viewer, user, individualUser, settingsAdmin, settingsUser, codeRepositoryIndexesAdmin, codeRepositoryIndexesViewer, codeToolsAdmin, codeToolsUser, repositoryGroupsUser, topicAdmin, topicReader."
  }
}
