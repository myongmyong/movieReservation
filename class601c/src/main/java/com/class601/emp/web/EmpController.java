package com.class601.emp.web;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.class601.comm.service.IdGenService;

import com.class601.emp.service.EmpService;
import com.class601.util.Paging;
import com.class601.util.Utils;
import com.class601.vo.EmpVo;

@Controller
public class EmpController {
	private final static Logger LOGGER = Logger.getLogger(EmpController.class);
	public static final String TABLE_NAME = "EMP";
	
	@Resource(name="empService")
	EmpService empService;

	@Resource(name="idGenService")
	IdGenService idGenService;
	
	@RequestMapping(value="/emp/empList.do")
	public String selectEmpList(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String empno = Utils.toEmptySpace(req.get("empno"));
		String pageNo = (req.get("pageNo") == null ? "1" : req.get("pageNo"));
		
		EmpVo vo = new EmpVo();
		vo.setEmpNo(empno);
		vo.setPageNo(Integer.parseInt(pageNo));
		vo.setPageSize(10);
		
		LOGGER.debug(vo.getEmpNo());
		
		List<EmpVo> resultList = empService.selectEmpList(vo);
		int totalCnt = empService.selectEmpListCount(vo);
		
		Paging paging = new Paging();
		paging.setPageNo(Integer.parseInt(pageNo));
		paging.setPageSize(10);
		paging.setTotalCount(totalCnt);
		
		model.addAttribute("resultList", resultList);
		model.addAttribute("paging", paging);
		
		model.addAttribute("empno", empno);
		
		return "emp/empList";
	}
	
	@RequestMapping(value="/emp/empView.do")
	public String empView(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String empno = req.get("empno");
		
		EmpVo vo = new EmpVo();
		vo.setEmpNo(empno);
		
		EmpVo resultVo = empService.selectEmp(vo);
		model.addAttribute("emp",resultVo);
		
		return "emp/empView";
	}
	
	@RequestMapping(value="/emp/empAddView.do")
	public String empAddView(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String nextId = idGenService.getNextId(TABLE_NAME);
		String deptno = req.get("deptno");
		
		model.addAttribute("nextId",nextId);
		
		
		return "emp/empAddView";
	}
	
	@RequestMapping(value="/emp/empAdd.do")
	public String empAdd(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String empno = req.get("empno");
		String ename = req.get("ename");
		String job = req.get("job");
		String mgr = req.get("mgr");
		String hiredate = req.get("hiredate");
		String sal = req.get("sal");
		String comm = req.get("comm");
		String deptno = req.get("deptno");
		
		EmpVo vo = new EmpVo();
		vo.setEmpNo(empno);
		vo.seteName(ename);
		vo.setJob(job);
		vo.setMgr(mgr);
		vo.setHireDate(hiredate);
		vo.setSal(sal);
		vo.setComm(comm);
		vo.setDeptNo(deptno);
		
		empService.addEmp(vo);
		
		return "redirect:/emp/empList.do";
		
	}
	
	@RequestMapping(value="/emp/empModifyView.do")
	public String empModifyView(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String empno = req.get("empno");
		String deptno = req.get("deptno");
		
		EmpVo vo = new EmpVo();
		vo.setEmpNo(empno);
		
		EmpVo resultVo = empService.selectEmp(vo);
		model.addAttribute("resultVo", resultVo);
		
		return "emp/empModifyView";
	}
	
	
	@RequestMapping(value="/emp/empModify.do")
	public String empModify(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String empno = req.get("empno");
		String ename = req.get("ename");
		String job = req.get("job");
		String mgr = req.get("mgr");
		String hiredate = req.get("hiredate").substring(0,10);
		String sal = req.get("sal");
		String comm = req.get("comm");
		String deptno = req.get("deptno");
		
		EmpVo vo = new EmpVo();
		vo.setEmpNo(empno);
		vo.seteName(ename);
		vo.setJob(job);
		vo.setMgr(mgr);
		vo.setHireDate(hiredate);
		vo.setSal(sal);
		vo.setComm(comm);
		vo.setDeptNo(deptno);
		
		empService.updateEmp(vo);
		
		return "redirect:/emp/empList.do";
	}
	
	
	@RequestMapping(value="/emp/empDelete.do")
	public String empDelete(@RequestParam HashMap<String, String> req, ModelMap model){
		
		String empno = req.get("empno");
		
		EmpVo vo = new EmpVo();
		vo.setEmpNo(empno);
		
		empService.deleteEmp(vo);
		
		return "redirect:/emp/empList.do";
	}
}
