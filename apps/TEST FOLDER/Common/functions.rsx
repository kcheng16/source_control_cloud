<GlobalFunctions>
  <JavascriptQuery
    id="CheckViewPermissions"
    overrideOrgCacheForUserCache={false}
    query={include("./lib/CheckViewPermissions.js", "string")}
    resourceName="JavascriptQuery"
    runWhenPageLoads={true}
    transformer="// Query results are available as the `data` variable
return formatDataAsArray(data)"
  />
  <State
    id="_APPS"
    value={
      '{\n  // List of all apps and associated metadata, by app UUID.\n  \n  // 3rd Party Auth\n  "d5c89738-d261-11ed-b794-7be5bb87533d": {\n    "name": "Auth Config",\n    "category": "build",\n    "icon": "{{"/icon:bold/interface-login-key"}}",\n    "spaces": ["any"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer"],\n      "edit": ["Retool Developer"],\n    },\n  },\n  // Schema Manager\n  "f43e7022-2656-11ee-8ce2-eb9875f414e1": {\n    "name": "Schema Manager",\n    "category": "build",\n    "icon": "{{"/icon:bold/computer-database"}}",\n    "spaces": ["any"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer"],\n      "edit": ["Retool Developer"],\n    },\n  },\n  // Schema Editor\n  "96acc9a4-2bf6-11ee-be7b-97d352aeab8c": {\n    "parent": "f43e7022-2656-11ee-8ce2-eb9875f414e1",\n  },\n  // Config Manager\n  "61421eec-30ae-11ee-a23e-b3d1d94eaa76": {\n    "name": "Config Manager",\n    "category": "build",\n    "icon": "{{"/icon:bold/computer-database"}}",\n    "spaces": ["any"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer"],\n      "edit": ["Retool Developer"],\n    },\n  },\n  // Config Editor\n  "3235ef80-32dd-11ee-a162-2f62c0c3682e": {\n    "parent": "61421eec-30ae-11ee-a23e-b3d1d94eaa76",\n  },\n  // Player Lookup\n  "534fd91c-1cf1-11ee-bc14-cf6c1fc1976a": {\n    "name": "Players",\n    "category": "manage",\n    "icon": "{{"/icon:bold/interface-user-single"}}",\n    "spaces": ["any"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer", "Retool Customer Support"],\n      "edit": ["Retool Member", "Retool Developer", "Retool Customer Support"],\n    },\n  },\n  // Player Data\n  "0d9b4dc0-1cdd-11ee-b6aa-fb6eff38da76": {\n    "parent": "534fd91c-1cf1-11ee-bc14-cf6c1fc1976a",\n  },\n\n  // User Lookup\n  "e67c5cb6-e5e1-11ed-b50c-2f93e1cba543": {\n    "name": "Users",\n    "category": "fortis account",\n    "spaces": ["any"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer", "Retool Customer Support"],\n      "edit": ["Retool Member", "Retool Developer", "Retool Customer Support"],\n    },\n  },\n  // User Info\n  "4e38c334-e926-11ed-8414-234fbedb3aa2": {\n    "parent": "e67c5cb6-e5e1-11ed-b50c-2f93e1cba543"\n  },\n\n  // Age Gate & Data Collection\n  "67505114-e2c5-11ed-a1ce-6bf3e2fcf944": {\n    "name": "AgeGate/Marketing",\n    "category": "fortis account",\n    "spaces": ["Retool Central", "All Users"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer", "Retool Legal"],\n      "edit": ["Retool Member", "Retool Developer", "Retool Legal"],\n    },\n  },\n  // Ban Display Name\n  "34e2d40a-f58e-11ed-8c3c-23af0e180f41": {\n    "name": "Ban Display Name",\n    "category": "fortis account",\n    "spaces": ["any"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer", "Retool Customer Support"],\n      "edit": ["Retool Member", "Retool Developer", "Retool Customer Support"],\n    }\n  },\n  // Terms of Service & Privacy Policy Configuration\n  "93d47228-da1f-11ed-9f01-f3e3b721462a": {\n    "name": "Tos/PP",\n    "category": "fortis account",\n    "spaces": ["Retool Central", "All Users"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer", "Retool Legal"],\n      "edit": ["Retool Member", "Retool Developer", "Retool Legal"],\n    },\n  },\n  // User Avatars\n  "a57fb916-fa67-11ed-b328-97a0dd95884d": {\n    "name": "Avatars",\n    "category": "fortis account",\n    "spaces": ["Retool Central", "All Users"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer"],\n      "edit": ["Retool Member", "Retool Developer"],\n    },\n  },\n\n  // Fortis Cloud Build\n  "fortis-cloud-build": {\n    "name": "Fortis Cloud Build",\n    "url": "https://portal.fortistools.games",\n    "category": "other tools",\n    "spaces": ["any"],\n    "roles": {\n      "view": ["Retool Member", "Retool Developer"],\n    },\n  },\n        \n  // Landing Page\n  "b59b40ce-d26a-11ed-aece-7301caeae6e8": {\n    "hidden": true,\n    "spaces": ["any"],\n    "roles": {\n      "view": ["any"],\n    },\n  },\n  // Manifest Manager\n  "27467d42-372e-11ee-a557-d75bf2cc5a7d": {\n    "spaces": ["any"],\n    "name": "Manifest Manager",\n    "category": "build",\n    "icon": "{{"/icon:bold/computer-database"}}",\n    "roles": {\n      "view": ["Retool Member", "Retool Developer"],\n      "edit": ["Retool Developer"],\n    },\n  },\n  // Manifest Editor\n  "cf6136c0-3cab-11ee-8617-a3fc915e1963": {\n    "parent": "27467d42-372e-11ee-a557-d75bf2cc5a7d",\n  },\n  // Interstitials\n  "e7502aee-6711-11ee-84bf-677740b188a8": {\n    "spaces": ["any"],\n    "name": "Interstitials",\n    "category": "build",\n    "icon": "{{"/icon:bold/computer-database"}}",\n    "roles": {\n      "view": ["Retool Member", "Retool Developer"],\n      "edit": ["Retool Developer"],\n    },\n  },\n  // Space Settings\n  "690db24a-468d-11ee-9ece-73bd2e2eb800": {\n    "hidden": true,\n    "spaces": ["any"],\n    "roles": {\n      "view": ["any"],\n    },\n  },\n}'
    }
  />
  <State id="_KEY_CURRENT_SPACE_KEY" value={'"current_space_key"'} />
  <State
    id="_ROLES"
    value="{
  // Role definition, by Role key, sorted by priority.
  'Retool Developer': {
    'name': 'Developer',
  },
  'Retool QA': {
    'name': 'QA',
  },
  'Retool Member': {
    'name': 'Member',
  },
  'Retool Customer Support': {
    'name': 'Customer Support',
  },
  'Retool Legal': {
    'name': 'Legal',
  },
}"
  />
  <Function id="_SPACES" funcBody={include("./lib/_SPACES.js", "string")} />
  <State
    id="_SPACES_DEV"
    value={
      "{\n  // Development (in retool, \"staging\") space definitions, by Space key.\n  'Retool Central': {\n    'name': 'Central (dev)',\n    'color': '#AAFFFF',\n    'catalog_id': 'central-dev',\n    'game_id': '3b560aba-5163-4f3a-897b-97faa96d0381'\n  },\n  'All Users': {\n    'name': 'Testing Space (dev)',\n    'color': '#FFAAFF',\n    'catalog_id': 'retool-dev-test',\n    'game_id': 'retool-dev-test'\n  },\n}"
    }
  />
  <State
    id="_SPACES_PROD"
    value={
      "{\n  // Production space definitions, by Space key.\n\n  // The key of each space needs to exactly match the Okta permissions group created by IT.\n  'Retool Central': {\n    // Display name within Retool\n    'name': 'Central',\n\n    // Color used in the landing page/space selection app\n    'color': '#AAFFFF',\n\n    // A \"catalog ID\" is used in the Sol API services.\n    // These are not explicitly created, it's more like a tag.\n    'catalog_id': 'central',\n\n    // \"Game ID\", managed by Terra Auth service.\n    // Needed to interface with Terra APIs.\n    'game_id': '73bfbadb-10a2-4bf4-93f2-1800cb0aabd7'\n  },\n  'Retool Atlas': {\n    'name': 'Atlas',\n    'color': '#AAAAFF',\n    'catalog_id': 'atlas',\n    'game_id': 'atlas'\n  },\n  'Retool Chimera': {\n    'name': 'Chimera',\n    'color': '#FFAAFF',\n    'catalog_id': 'chimera',\n    'game_id': '2a8ae123-74fb-4143-91c6-01a1fead948f'\n  },\n  'Retool Demeter': {\n    'name': 'Demeter',\n    'color': '#AAFFAA',\n    'catalog_id': 'demeter',\n    'game_id': 'demeter'\n  }\n}"
    }
  />
  <Function
    id="_allAppPermissions"
    funcBody={include("./lib/_allAppPermissions.js", "string")}
  />
  <Function
    id="_availableSpaceKeys"
    funcBody={include("./lib/_availableSpaceKeys.js", "string")}
  />
  <Function
    id="_currentAppPermissions"
    funcBody={include("./lib/_currentAppPermissions.js", "string")}
  />
  <Function
    id="_currentRole"
    funcBody={include("./lib/_currentRole.js", "string")}
  />
  <Function
    id="_currentRoleId"
    funcBody={include("./lib/_currentRoleId.js", "string")}
  />
  <Function
    id="_currentRoleKey"
    funcBody={include("./lib/_currentRoleKey.js", "string")}
  />
  <Function
    id="_currentSpace"
    funcBody={include("./lib/_currentSpace.js", "string")}
  />
  <Function
    id="_currentSpaceId"
    funcBody={include("./lib/_currentSpaceId.js", "string")}
  />
  <Function
    id="_currentSpaceKey"
    funcBody={include("./lib/_currentSpaceKey.js", "string")}
  />
</GlobalFunctions>
