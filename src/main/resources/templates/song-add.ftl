<#import "parts/common.ftl" as c>
<@c.page>

    <form action="/song/new" method="post">

        <h1 align="center" style="color:Black">Добавить</h1>

        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <label for="title" class="cols-sm-2 control-label">Название</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="name" class="form-control"
                                               placeholder="название"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="cols-sm-2 control-label">Исполнитель</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="singer" class="form-control"
                                               placeholder="исполнитель"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="cols-sm-2 control-label">Альбом</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="album" class="form-control"
                                               placeholder="альбом"/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="description" class="cols-sm-2 control-label">Жанр</label>
                                <div class="cols-sm-10">
                                    <div class="input-group">
                                        <input type="text" name="style" class="form-control"
                                               placeholder="жанр"/>
                                    </div>
                                </div>
                            </div>

                            <div align="center">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-primary">Сохранить</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

</@c.page>