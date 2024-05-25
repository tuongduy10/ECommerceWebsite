import { api } from "../_api/api";

export default class CmsService {
  public static async getBlog(id: number) {
    return await api.get(`/cms/blog/${id}`);
  }
  public static async getBlogs() {
    return await api.get(`/cms/blogs`);
  }
  public static async saveBlog(param: any) {
    return await api.post(`/cms/save-blog`, param);
  }
  public static async saveConfig(param: any) {
    return await api.post(`/cms/save-config`, param);
  }
  public static async getConfig() {
    return await api.get('/cms/config');
  }
}
