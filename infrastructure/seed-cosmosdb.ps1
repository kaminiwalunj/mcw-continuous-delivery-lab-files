docker login ghcr.io -u kamini@spektrasystems.com -p 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

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

