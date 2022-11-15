
          $studentprefix = "790341"
          $githubAccount = "kaminiwalunj"
          $resourcegroupName = "fabmedical-rg-" + $studentprefix
          $cosmosDBName = "fabmedical-cdb-" + $studentprefix
          # Fetch CosmosDB Mongo connection string
          $mongodbConnectionString = `
          $(az cosmosdb keys list `
              --name $cosmosDBName `
              --resource-group $resourcegroupName `
              --type connection-strings `
              --query 'connectionStrings[0].connectionString')
          # Seed CosmosDB database
          docker run -ti `
           -e MONGODB_CONNECTION="$mongodbConnectionString" `
               ghcr.io/$githubAccount/fabrikam-init:main
