package com.itheima.bos.dao.base;

import java.io.Serializable;
import java.util.List;

public interface BaseDao<T> {
    public void save(T t);
    public void delete(T t);
    public void update(T t);
    public T selectByID(Serializable id);
    public List<T> selectAll();
}
