# Generate an Nx Workspace

```
npx create-nx-workspace afftracker
```

# Run the app

```
nx serve client # The react app
nx serve api    # The nest api
nx run-many --parallel --target=serve --projects=client,api
```

# Prisma migrate

```
prisma migrate dev --name added table
```
