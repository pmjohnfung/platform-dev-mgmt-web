<%@ page contentType="text/html; charset=utf-8"%>
<%@page import="com.binary.core.util.BinaryUtils"%>

<%
String ContextPath = request.getContextPath();
%>

<jsp:include page="/layout/jsp/head.jsp"></jsp:include>


<!-- 正文 -->
<div class="main-box">
	<header class="main-box-header clearfix"> </header>
	<div class="main-box-body clearfix">
		<form class="form-horizontal" role="form" id="form_buildDef">
		<div class="form-group">
				<label for="isExternal" class="col-lg-2 control-label">是否外部工程:</label>
				<div class="col-lg-1">
					<input type="checkbox" name="isExternal" id="isExternal">
				</div>
				<div class="col-lg-11">
					<span></span>
				</div>
			</div>
			<div id="div_isExternal_no">
				<div class="form-group">
					<label for="productId" class="col-lg-2 control-label">所属产品<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<select id="productId" name="productId" class="form-control" >
						</select>
					</div>
					<div class="col-lg-5">
						<span></span>
					</div>
				</div>
				<div class="form-group">
					<label for="projectId" class="col-lg-2 control-label">所属工程<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<select id="projectId" name="projectId" class="form-control" >
						</select>
					</div>
					<div class="col-lg-5">
						<span></span>
					</div>
				</div>
			</div>
			<div class="form-group">
				<label for="buildName" class="col-lg-2 control-label">构建名<font color="red">*</font>:</label>
				<div class="col-lg-5">
					
					<div id="buildNameText" class="num_tit"></div>
					
					<input type="text" name="buildName"  class="form-control" id="buildName" required pattern="([0-9]|[a-zA-Z]|[_]|[/]){1,200}" placeholder="必填">
				</div>
				<div class="col-lg-5 set_num">
					<span>1-200位字母、数字、下划线或斜线的组合</span>
					<span class="error_tit">构建名已存在!</span>
					<span class="success_tit">构建名通过!</span>
				</div>
			</div>
			
			<div id="div_isExternal_yes">
				<div class="form-group">
					<label class="col-lg-2 control-label">代码库类型:</label>
					<div class="col-lg-5">
						<input type="radio" id="respType1" name="respType" placeholder="" >
						<label for="respType1">&nbsp;SVN</label>&nbsp;&nbsp;&nbsp;&nbsp;
						
						<input type="radio" id="respType2" name="respType" placeholder="" checked>
						<label for="respType2">&nbsp;GIT</label>
						
					</div>
					<div class="col-lg-5">
						<span></span>
					</div>
				</div>
				<div class="form-group">
					<label for="respUrl" class="col-lg-2 control-label">代码库URL<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<input type="text" name="respUrl" class="form-control" required id="respUrl" pattern=".{1,200}" placeholder="必填">
					</div>
					<div class="col-lg-5">
						<span>1-200位</span>
					</div>
				</div>
				<div class="form-group">
					<label for="respBranch" class="col-lg-2 control-label">分支<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<input type="text" name="respBranch" class="form-control" required id="respBranch" pattern=".{1,60}" placeholder="必填">
					</div>
					<div class="col-lg-5">
						<span>1-60位</span>
					</div>
				</div>
				<div class="form-group">
					<label for="respUser" class="col-lg-2 control-label">账号<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<input type="text" name="respUser" class="form-control" required id="respUser" pattern=".{1,40}" placeholder="必填">
					</div>
					<div class="col-lg-5">
						<span>1-40位</span>
					</div>
				</div>
				<div class="form-group">
					<label for="respPwd" class="col-lg-2 control-label">密码<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<input type="password" name="respPwd" class="form-control" required id="respPwd" maxlength="40" placeholder="必填">
					</div>
					<div class="col-lg-5">
						<span></span>
					</div>
				</div>
			</div>
			<div id="div_isBuildImage_yes">
				<div class="form-group">
					<label for="imageDefId" class="col-lg-2 control-label">镜像定义<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<select id="imageDefId" name="imageDefId" class="form-control">
						</select>
					</div>
					<div class="col-lg-5">
						<span></span>
					</div>
				</div>
				<div class="form-group">
					<label for="dockerFilePath" class="col-lg-2 control-label">DockerFile路径:<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<input type="text" name="dockerFilePath" class="form-control" id="dockerFilePath" maxlength="100" placeholder="必填">
					</div>
					<div class="col-lg-5">
						<span></span>
					</div>
				</div>
				<div class="form-group">
					<label for="depTag" class="col-lg-2 control-label">tag标记<font color="red">*</font>:</label>
					<div class="col-lg-5">
						<input type="text" name="depTag" class="form-control" required id="depTag" pattern=".{1,40}" placeholder="格式为X.X.X 且X为0~9的数字 (必填)">
					</div>
					<div class="col-lg-5">
						<span class="tag_tit" style="color:red">输入格式有误!</span>
						<span class="tag_success" style="color:green">输入格式正确!</span>
					</div>
				</div>
				<div class="form-group"> 
					<label for="openEmail" class="col-lg-2 control-label"><input type="checkbox" name="openEmail" id="openEmail"></label>
					<div class="col-lg-5">
						<span>是否增加构建邮件通知 </span>
					</div>
					<div class="col-lg-5">
						<span></span>
					</div>
				</div>
				<div class="form-group"> 
					<label for="openCache" class="col-lg-2 control-label"><input type="checkbox" name="openCache" id="openCache"></label>
					<div class="col-lg-5">
						<span>是否开启构建缓存 </span>
					</div>
					<div class="col-lg-5">
						<span></span>
					</div>
				</div>
				
			</div>
			<div class="form-group">
				<div class="col-lg-offset-2 col-lg-10">
					<button type="submit" id="btn_submit" class="btn btn-success">提交</button>
				</div>
			</div>
		</form>
	</div>
</div>

<div id="sel_forcenter" style="width:300px;position:absolute;display:none;"></div>

<jsp:include page="/layout/jsp/footer.jsp"></jsp:include>
