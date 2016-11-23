package net.sunniwell.vms.service;

import net.sunniwell.vms.model.OperatorModel;

import java.util.List;

/**
 * @author zhoudeming
 * @date 2016/11/13
 */
public interface OperatorService {

    OperatorModel login(String id, String password) throws Exception;

    boolean changePassword(String oldPwd, String newPwd) throws Exception;

    boolean checkId(String id) throws Exception;

    int add(OperatorModel model) throws Exception;

    int edit(OperatorModel model) throws Exception;

    int del(List<String> idList) throws Exception;

    List<OperatorModel> findAll() throws Exception;
}
