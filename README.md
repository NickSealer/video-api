# video-api

Enpoints and actions

## Open endpoints

```
GET       /api/v1/heath                   Api status
GET       /api/v1/heath/videos            Video list
GET       /api/v1/heath/videos/:slug      Show video
```

## Authentication endpoints

```
POST      /api/v1/auth                    Registration
POST      /api/v1/auth/sign_in            Login
DELETE    /api/v1/auth/sign_out           Logout
```

## Authenticated endpoints

```
GET       /api/v1/videos                  Video list
POST      /api/v1/videos                  Create video
GET       /api/v1/videos/:slug            Show video
PUT       /api/v1/videos/:slug            Update video
DELETE    /api/v1/videos/:slug            Delete video
```

## Sign up
```
{
  "name": "name",
  "email": "email@email.com",
  "password": "password",
  "password_confirmation": "password"
}
```

## Login
```
{
  "email": "email@email.com",
  "password": "password"
}
```

## Headers
```
access-token
client
uid
```

## Create / Update video
```
{
  "name": "video name",
  "description": "video description",
  "url": "video url"
}
```
