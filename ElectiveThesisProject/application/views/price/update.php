<div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">New Price Updates</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Price Update Header
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form">
                                     <div class="form-group">
                                            <label>Selects Provice/City</label>
                                            <select class="form-control">
                                                <option>Select</option>
                                          <?php foreach ($place as $datas => $data): ?>
                                                <option value="<?php echo $data->ID; ?>"><?php echo $data->placeNAME;?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                     <div class="panel panel-default">
                        <div class="panel-heading">
                            Product Update
                             <a href="javascript:void(0);" class="add_btn" title="Add field">Add Field<i class="fa fa-plus-circle"></i></a>                              
                        </div>
                        <div class="panel-body">
                            <div class="row">
                                     <form role="form" class="form_wrapper">
                                     <div>
                                        <div class="form-group col-md-4">
                                            <label>Selects Product</label>
                                            <select class="form-control">
                                                <option>Select</option>
                                          <?php foreach ($product as $datas => $data): ?>
                                                <option value="<?php echo $data->productID; ?>"><?php echo $data->name;?></option>
                                                <?php endforeach; ?>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-4">
                                            <label>New Price</label>
                                            <input class="form-control">
                                        </div>
                                        <div class="form-group col-md-3">
                                            <label>Unit of Measure</label>
                                            <select class="form-control">
                                                <option>Select</option>
                                          <?php foreach ($uom as $datas => $data): ?>
                                                <option value="<?php echo $data->unitofmeasureID; ?>"><?php echo $data->unitofmeasure;?></option>
                                                <?php endforeach; ?>
                                            </select>

                                        </div>                                                        
                                    </div>    
                                    </form>  
                                    </div>  <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                        <div class="panel-footer">
                            <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                        </div>
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->                                  
<script src="<?php echo base_url('assets/js/jquery.js'); ?>"></script>
<script type="text/javascript">
$(document).ready(function(){
    var maxField = 10; //Input fields increment limitation
    var addButton = $('.add_btn'); //Add button selector
    var wrapper = $('.form_wrapper'); //Input field wrapper
    var fieldHTML = '<div><div class="form-group col-md-4"><select class="form-control"><option>Select</option><?php foreach ($product as $datas => $data): ?><option value="<?php echo $data->productID; ?>"><?php echo $data->name;?></option><?php endforeach; ?></select></div><div class="form-group col-md-4"><input class="form-control"></div><div class="form-group col-md-3"><select class="form-control"><option>Select</option><?php foreach ($uom as $datas => $data): ?><option value="<?php echo $data->unitofmeasureID; ?>"><?php echo $data->unitofmeasure;?></option><?php endforeach; ?></select></div><a href="javascript:void(0);" class="remove_btn col-md-1 btn btn-danger btn-circle" title="Remove field"><i class="fa fa-minus"></i></a></div>'; //New input field html 
    var x = 1; //Initial field counter is 1

    $(addButton).click(function(){ //Once add button is clicked
        if(x < maxField){ //Check maximum number of input fields
            x++; //Increment field counter
            $(wrapper).append(fieldHTML); // Add field html
        }
    });
    $(wrapper).on('click', '.remove_btn', function(e){ //Once remove button is clicked
        e.preventDefault();
        $(this).parent('div').remove(); //Remove field html
        x--; //Decrement field counter
    });
});
</script>

                           
                          
                          