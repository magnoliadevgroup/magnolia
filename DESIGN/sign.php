<?php


?>






<div id="sign" class="section-padding">
    <div class = "container">
	   	<ul class="nav nav-pills navbar-default nav-justified fonttwenty">
			<li class="active"><a href="#signin" data-toggle="tab">Signin</a></li>
			<li><a href="#signup" data-toggle="tab">Signup</a></li>
		</ul>
		
	<div id="sign_TabContent" class="tab-content">
	<!--SIGNIN START-->	
		<div class="form-sec tab-pane active in" id="signin">
			<form action="" method="post" name="Login_Form" class="form-sign">       
			    <h3 class="form-signin-heading">Welcome Back! Please Sign In</h3>
				  <hr class="si_colorgraph">
				  <div class="form-group">
				  <input type="text" class="text-field-box form-control inputtext" name="Username" placeholder="Username" required="" autofocus="" />
				  <input type="password" class="text-field-box form-control inputpassword" name="Password" placeholder="Password" required=""/>     		  
				  </div>
				  <hr class="si_colorgraph">
				  <button class="button-medium" id="signin-submit" type="submit" name="contact">Sign In</button> 			
			</form>			
		</div>

<!--SIGNIN END-->

<!--SIGNUP START-->

<div id="signup" class="tab-pane fade row">
    <div class="form-sec col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3">
		<form role="form" class="form-sign">
			<h2>Please Sign Up</h2>
			<hr class="si_colorgraph">
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
                        <input type="text" name="first_name" id="first_name" class="text-field-box form-control inputtext input-lg" placeholder="First Name" tabindex="1">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="text" name="last_name" id="last_name" class="text-field-box form-control inputtext input-lg" placeholder="Last Name" tabindex="2">
					</div>
				</div>
			</div>
			<div class="form-group">
				<input type="text" name="display_name" id="display_name" class="text-field-box form-control inputtext input-lg" placeholder="Display Name" tabindex="3">
			</div>
			<div class="form-group">
				<input type="email" name="email" id="email" class="text-field-box form-control inputtext input-lg" placeholder="Email Address" tabindex="4">
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="password" id="password" class="text-field-box form-control inputpassword input-lg" placeholder="Password" tabindex="5">
					</div>
				</div>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<div class="form-group">
						<input type="password" name="password_confirmation" id="password_confirmation" class="text-field-box form-control inputpassword input-lg" placeholder="Confirm Password" tabindex="6">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 col-md-12">
					 By clicking <strong class="label label-primary defaultcolor">Register</strong>, you agree to the <a href="#" data-toggle="modal" data-target="#t_and_c_m">Terms and Conditions</a> set out by this site, including our Cookie Use.
				</div>
			</div>
			
			<hr class="si_colorgraph">
			<div class="row">
				<div class="col-xs-12 col-md-12"><button class="button-medium" id="reg-submit" type="submit" name="contact">Sign Up</button></div>
			</div>
		</form>
	</div>
</div>
<!-- Modal -->
<div class="modal fade" id="t_and_c_m" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
				<h4 class="modal-title" id="myModalLabel">Terms & Conditions</h4>
			</div>
			<div class="modal-body">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Similique, itaque, modi, aliquam nostrum at sapiente consequuntur natus odio reiciendis perferendis rem nisi tempore possimus ipsa porro delectus quidem dolorem ad.</p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal">I Agree</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</div>
<!--SIGNUP END-->


	</div>
</div>
