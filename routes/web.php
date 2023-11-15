<?php

use App\Http\Controllers\AdjuntarDocumentoController;
use App\Http\Controllers\ConfiguracionController;
use App\Http\Controllers\DependenciaController;
use App\Http\Controllers\DocumentoController;
use App\Http\Controllers\EstanteController;
use App\Http\Controllers\FuncionarioController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\OficinaController;
use App\Http\Controllers\PrestamoDocumentoController;
use App\Http\Controllers\ReporteController;
use App\Http\Controllers\ReservaDocumentoController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;


// LOGIN
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout']);

// CONFIGURACIÓN
Route::get('/configuracion/getConfiguracion', [ConfiguracionController::class, 'getConfiguracion']);

Route::middleware(['auth'])->group(function () {
    Route::post('/configuracion/update', [ConfiguracionController::class, 'update']);

    Route::prefix('admin')->group(function () {
        // Usuarios
        Route::post('usuarios/updatePassword/{usuario}', [UserController::class, 'updatePassword']);
        Route::post('usuarios/imprimirCredencial/{usuario}', [UserController::class, 'imprimirCredencial']);
        Route::get('usuarios/getUsuarioTipo', [UserController::class, 'getUsuarioTipo']);
        Route::get('usuarios/getUsuario/{usuario}', [UserController::class, 'getUsuario']);
        Route::patch('usuarios/asignarConfiguracion/{usuario}', [UserController::class, 'asignarConfiguracion']);
        Route::get('usuarios/userActual', [UserController::class, 'userActual']);
        Route::get('usuarios/getInfoBox', [UserController::class, 'getInfoBox']);
        Route::get('usuarios/getPermisos/{usuario}', [UserController::class, 'getPermisos']);
        Route::get('usuarios/getEncargadosRepresentantes', [UserController::class, 'getEncargadosRepresentantes']);
        Route::post('usuarios/actualizaContrasenia/{usuario}', [UserController::class, 'actualizaContrasenia']);
        Route::post('usuarios/actualizaFoto/{usuario}', [UserController::class, 'actualizaFoto']);
        Route::resource('usuarios', UserController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Funcionarios
        Route::get("dependencias/getLastFuncionario", [FuncionarioController::class, 'getLastFuncionario']);
        Route::resource('funcionarios', FuncionarioController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Dependencias
        Route::get("dependencias/getLastDependencia", [DependenciaController::class, 'getLastDependencia']);
        Route::resource('dependencias', DependenciaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Oficinas
        Route::resource('oficinas', OficinaController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Estantes
        Route::get("estantes/nivel_division/{estante}", [EstanteController::class, 'nivel_division']);
        Route::resource('estantes', EstanteController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Documentos
        Route::get('documentos/archivo_reservado', [DocumentoController::class, 'archivo_reservado']);
        Route::get('documentos/archivo', [DocumentoController::class, 'archivo']);
        Route::post('adjuntar_documentos/store/{documento}', [AdjuntarDocumentoController::class, 'store']);
        Route::delete('adjuntar_documentos/{adjuntar_documento}', [AdjuntarDocumentoController::class, 'destroy']);
        Route::get('documentos/adjuntar_documentos/{documento}', [DocumentoController::class, 'adjuntar_documentos']);
        Route::resource('documentos', DocumentoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Reserva documentos
        Route::resource('reserva_documentos', ReservaDocumentoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // Prestamo documentos
        Route::resource('prestamo_documentos', PrestamoDocumentoController::class)->only([
            'index', 'store', 'update', 'destroy', 'show'
        ]);

        // REPORTES
        Route::post('reportes/usuarios', [ReporteController::class, 'usuarios']);
    });
});

// ADMINISTRACIÓN
Route::get('/{optional?}', function () {
    return view('app');
})->name('base_path')->where('optional', '.*');
