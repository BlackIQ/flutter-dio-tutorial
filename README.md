# Flutter + API tutorial

In this project we learn how to use **RESTFUL API**s in Flutter. With APIs you can create network requests and do something with that.

## Flutter

### Dio

**Dio** is a Dart package you can use for APIs in Flutter. There are similar packages like **HTTP** and **Chopper**. I used **Dio** cause it is really simple and fast!

For more information, head over to [Dio page](https://pub.dev/packages/dio).

### Provider

**Provider** is a state management that you can store your application state with it. We have **Redux** in ReactJs if you are familiar with.

For more information, head over to [Provider page](https://pub.dev/packages/provider).

### How to run

To run Flutter application, just clone this repository, go inside it, and run `flutter run`.

## API - Back-End

I created the API with **NodeJs**. It is stored in `api` directory. It is kind of a **MERN** ( MongoDB, ExpressJs, ReactJs, NodeJs ) application. But there is no ReactJs for this project. I think we can call it **MEFN** ( MongoDB, ExpressJs, Flutter, NodeJs )!

### API Endpoints

| Method | Route | Details |
|--|--| -- |
| POST | `/api/user/login` | Login user |
| POST | `/api/user/register` | Register user |
| PUT | `/api/user/change` | Update user data |
| GET | `/api/user/get/users` | Get all users |
| GET | `/api/user/get/user/:uid` | Get user date |

### MVC

Yeah, it is **MVC**. No more information.

### How to run

We assume that you cloned repository. Next, go inside repository and `api` directory. Now run following commands:

```shell
$ npm i
$ npm test
```