<div class="row-fluid row-custom">
    <div class="grid simple">
        <div class="grid-title">
            <div class="row">
                <div class="col-md-9">
                    <h3>Create Case</h3>
                </div>
                
                <div class="dropdown pull-right" style="margin-top: 5px;">
                    <button id="create-new" class="btn btn-default btn-sm"><i class="fa fa-plus"></i></button>
                </div>
            </div>
        </div>
        <div class="grid-body collapse <?php if(validation_errors()) echo 'in'; ?>" id="create-form">
            <div class="col-md-10 col-md-offset-1">
                <form action="<?php echo base_url('admin/investigation/officer/create');?>" class="form-horizontal" enctype="multipart/form-data" method="post">
                    <div class="form-group">
                        <div class="col-md-2">
                            <label for="io_name">Full Name</label>
                        </div>
                        <div class="col-md-10">
                            <input type="text" class="form-control" name="io_name" placeholder="Enter Full Name" required>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-2">
                            <label for="gender">Gender</label>
                        </div>
                        <div class="col-md-10">
                            <select name="gender" id="gender" class="form-control">
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                    </div>


                     <div class="form-group">
                        <div class="col-md-2">
                            <label for="rank">Rank</label>
                        </div>
                        <div class="col-md-10">
                            <select name="rank" id="rank" class="form-control">
                                <option value="0">Officer In Charge</option>
                                <option value="1">SI</option>
                                <option value="2">ASP</option>
                                <option value="3">ACP</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="text-right">
                        <input type="submit" class="btn btn-info" value="Create Officer">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div class="grid simple">
        <div class="grid-title">
            <div class="row">
                <div class="col-md-9">
                    <h3>Investigation Officer List</h3>
                </div>
            </div>
        </div>
        <div class="grid-body">
            <div class="col-md-12">
                <table class="table datatable">
                    <thead>
                        <th>ID</th>
                        <th>Petitioner Name</th>
                        <th>Victim Name</th>
                        <th>Date File</th>
                        <th>Time Filled</th>
                        <th>Date Of Incident</th>
                        <th>Time Of Incident</th>
                        <th>Place</th>
                        <th>Accuser</th>
                    </thead>
                    <tbody>
                        <?php foreach ($firs as $fir):?>
                            <tr>
                                <td><?php echo $fir->FIR_no;?></td>
                                <td>
                                    <?php 
                                        $result = $this->db->query("SELECT * FROM petitioner WHERE petitioner_id='$fir->petitioner_id'")->row();
                                        
                                    ?>
                                    <a href="<?php echo base_url('admin/petitioner/'.$fir->petitioner_id);?>"><?php echo $result->first_name.' '.$result->middle_name. ' '. $result->last_name;?></a>
                                </td>
                                <td>
                                    <?php 
                                        $result = $this->db->query("SELECT * FROM victim WHERE victim_id='$fir->victim_id'")->row();
                                        
                                    ?>
                                    <a href="<?php echo base_url('admin/victim/'.$fir->victim_id);?>"><?php echo $result->first_name.' '.$result->middle_name. ' '. $result->last_name;?></a>
                                </td>
                                <td><?php echo date("d-m-Y", strtotime($fir->date_file));?></td>
                                <td><?php echo date("h:m a", strtotime($fir->time_filled));?></td>
                                <td><?php echo date("d-m-Y", strtotime($fir->date_incident));?></td>
                                <td><?php echo date("h:m a", strtotime($fir->time_incident));?></td>
                                <td><?php echo $fir->place_incident;?></td>
                                <td>
                                    <?php 
                                        $result = $this->db->query("SELECT * FROM accused WHERE accused_id='$fir->accused_id'")->row();
                                        
                                    ?>
                                    <a href="<?php echo base_url('admin/accuser/'.$fir->accused_id);?>"><?php echo $result->accused_name;?></a>
                                </td>
                            </tr>
                        <?php endforeach;?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>