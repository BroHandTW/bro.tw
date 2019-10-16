import Axios from 'axios';

const baseURL = 'http://www.lvh.me:3000/api';

const csrfParam = document.querySelector("meta[name=csrf-param]").content;
const csrfToken = document.querySelector("meta[name=csrf-token]").content;

const baseRequest = Axios.create({
  baseURL: `${baseURL}`
});

baseRequest.interceptors.request.use(function(config){
  config.withCredentials = true // 帶著 cookie
  config.headers['X-CSRF-Token'] = csrfToken ;
  return config
}, function(error){
  //请求错误时做些事
  return Promise.reject(error);
});

// // User相關的 api
// const userRequest = Axios.create({
//   baseURL: `${baseURL}/users`
// });
// // 文章相關的 api
// const articleRequest = Axios.create({
//   baseURL: `${baseURL}/article`
// });
// // 搜尋相關的 api
// const searchRequest = Axios.create({
//   baseURL: `${baseURL}/search`
// });

export const axios = Axios;
export const apiBaseHelloGet = data => baseRequest.get('/hello', { params: data });
export const apiBaseHelloPost = data => baseRequest.post('/hello', { data });
export const apiBaseHelloPut = data => baseRequest.put('/hello', { data });
export const apiBaseHelloPatch = data => baseRequest.patch('/hello', { data });
export const apiBaseHelloDelete = data => baseRequest.delete('/hello', { data });
export const apiGetEncode = data => baseRequest.get('/encode', { params: data });

// // User 相關的 api
// export const apiUserLogin = data => userRequest.post('/signIn', data);
// export const apiUserLogout = data => userRequest.post('/signOut', data);
// export const apiUserSignUp = data => userRequest.post('/signUp', data);

// // 文章相關的 api
// export const apiArticleItem = () => articleRequest.get('/ArticleItem');
// export const apiArticleMsg = data => articleRequest.post('/ArticleMsg', data);
// export const apiArticleLink = data => articleRequest.post('/ArticleLink', data);

// // 搜尋相關的 api
// export const apiSearch = data => searchRequest.get(`/Search?searchdata=${data}`);
// export const apiSearchType = () => searchRequest.get(`/SearchType`);
