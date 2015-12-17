<div id="page-wrapper">
 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Tables</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
<div class="row">
	                <div class="col-lg-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Basic Table
                            <button class="btn btn-primary btn-xs modal_btn" data-toggle="modal" data-target="#myModal">
                                Add
                            </button>
                                            <!--<form id="create-new-uom-form" method="post">
                                            <div class="form-group">
                                                
                                                <label for="unitofmeasure">Name of the new unit</label>
                                                <input type="text" name="unitofmeasure" class="form-control" id="unitofmeasure"/>
                                                <span class="alert-danger" id="err-unitofmeasure"></span>
                                            </div>
                                             <div class="form-group">
                                            <button type="button" class="btn btn-primary" id="save-new-uom-form">Save
                                            </button>
                                            </div>
                                            </form>-->
                        </div>


                        <!-- /.panel-heading -->

                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Add Field for Unit of Measure</h4>
                                        </div>
                                        
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <form id="create-new-uom-form" method="post">
												<label for="unitofmeasure">Name of the new unit</label>
												<input type="text" name="unitofmeasure" class="form-control" id="unitofmeasure"/>
            									<span class="alert-danger" id="err-unitofmeasure"></span>
											</div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                            <button type="button" class="btn btn-primary" id="save-new-uom-form">Save</button>
                                            </form>
                                        </div>
                                        
                                    </div>
                                 <!--    /.modal-content --> 
                                </div>
                              <!--   /.modal-dialog -->
                           </div>
                            <!-- /.modal -->
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Unit of Measure</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                         <?php foreach ($uom as $datas => $data): ?>      
                                        <tr>
                                            <td><?php echo $data->unitofmeasureID; ?></td>
                                            <td><?php echo $data->unitofmeasure;?></td>
                                        </tr>
                                        <?php endforeach; ?>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-6 -->
			</div>

	<!-- /.row -->

</div>