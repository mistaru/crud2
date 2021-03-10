<#import "parts/common.ftl" as c>
<@c.page>

    <form action="/playlist/add" method="post">
        <input type="hidden" value="${playlist.id}" name="id">

        <h3 align="center" style="color:Black">Edit: ${playlist.name}</h3>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="title" class="cols-sm-2 control-label">Name</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="name" class="form-control" placeholder="name"
                                               value="${playlist.name}"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="cols-sm-2 control-label">Description</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="description" class="form-control"
                                               placeholder="description" value="${playlist.description}"/>
                                    </div>
                                </div>
                            </div>


                            <div align="center">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</@c.page>