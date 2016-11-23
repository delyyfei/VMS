package net.sunniwell.vms.mapper;

import net.sunniwell.vms.model.OperatorModel;
import org.apache.ibatis.annotations.Param;

import java.sql.SQLException;
import java.util.List;

public interface OperatorModelMapper {

    Object insert(OperatorModel model) throws SQLException;

    int changePassword(@Param("id") String id, @Param("password") String password) throws SQLException;

    OperatorModel selectByIdAndPwd(@Param("id") String id, @Param("password") String password) throws SQLException;

    List<OperatorModel> selectAll() throws SQLException;
}