package multicampus.kb03.IPOwer.dao;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import multicampus.kb03.IPOwer.dto.CompanyDemandDto;
import multicampus.kb03.IPOwer.dto.CompanyDto;
import multicampus.kb03.IPOwer.dto.UsersRoleDto;

@Mapper
public interface CompanyDemandMapper {
	
	@Select("select * from company")
	List<CompanyDto> findAllCompany();
	
	@Select("select \r\n" + 
			"c.*," + 
			"d.* \r\n" + 
			"from company c join demandforecast d on c.company_pk = d.company_pk;")
	List<CompanyDemandDto> findAllCompanyDemand();
	
	@Select("select \r\n" + 
			"c.*,d.* \r\n" +
			"from company c join demandforecast d on c.company_pk = d.company_pk\r\n" + 
			"where company_ticker=#{ticker};")
	CompanyDemandDto findOneCompanyDemand(@Param("ticker") int companyTicker);
	
	@Insert("")
	int saveCompany(CompanyDto companyDto);
}