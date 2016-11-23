package net.sunniwell.vms.service.impl;

import net.sunniwell.vms.mapper.OperatorModelMapper;
import net.sunniwell.vms.model.OperatorModel;
import net.sunniwell.vms.service.OperatorService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author zhoudeming
 * @date 2016/11/13
 */
@Service
public class OperatorServiceImpl implements OperatorService {

    @Resource
    private OperatorModelMapper operatorModelMapper;

    @Override
    public OperatorModel login(String id, String password) throws Exception {
        return this.operatorModelMapper.selectByIdAndPwd(id, password);
    }

    @Override
    public boolean changePassword(String oldPwd, String newPwd) throws Exception {
        return false;
    }

    @Override
    public boolean checkId(String id) throws Exception {
        return false;
    }

    @Override
    public int add(OperatorModel model) throws Exception {
        return 0;
    }

    @Override
    public int edit(OperatorModel model) throws Exception {
        return 0;
    }

    @Override
    public int del(List<String> idList) throws Exception {
        return 0;
    }

    @Override
    public List<OperatorModel> findAll() throws Exception {
        return this.operatorModelMapper.selectAll();
    }
}
