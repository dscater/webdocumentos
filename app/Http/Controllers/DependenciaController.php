<?php

namespace App\Http\Controllers;

use App\Models\Dependencia;
use App\Models\HistorialAccion;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class DependenciaController extends Controller
{
    public $validacion = [
        'nombre' => 'required|min:2',
    ];

    public $mensajes = [
        'nombre.required' => 'Este campo es obligatorio',
        'nombre.min' => 'Debes ingressar al menos 4 carácteres',
    ];

    public function index(Request $request)
    {
        $dependencias = Dependencia::orderBy("id", "desc")->get();
        return response()->JSON(['dependencias' => $dependencias, 'total' => count($dependencias)], 200);
    }

    public function store(Request $request)
    {
        $request->validate($this->validacion, $this->mensajes);
        $request['fecha_registro'] = date('Y-m-d');
        DB::beginTransaction();
        try {
            // crear el Dependencia
            $nueva_dependencia = Dependencia::create(array_map('mb_strtoupper', $request->all()));

            $datos_original = HistorialAccion::getDetalleRegistro($nueva_dependencia, "dependencias");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'CREACIÓN',
                'descripcion' => 'EL DEPENDENCIA ' . Auth::user()->dependencia . ' REGISTRO UN DEPENDENCIA',
                'datos_original' => $datos_original,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'dependencia' => $nueva_dependencia,
                'msj' => 'El registro se realizó de forma correcta',
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function update(Request $request, Dependencia $dependencia)
    {
        $request->validate($this->validacion, $this->mensajes);
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($dependencia, "dependencias");
            $dependencia->update(array_map('mb_strtoupper', $request->all()));
            $datos_nuevo = HistorialAccion::getDetalleRegistro($dependencia, "dependencias");
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'MODIFICACIÓN',
                'descripcion' => 'EL DEPENDENCIA ' . Auth::user()->dependencia . ' MODIFICÓ UN DEPENDENCIA',
                'datos_original' => $datos_original,
                'datos_nuevo' => $datos_nuevo,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'dependencia' => $dependencia,
                'msj' => 'El registro se actualizó de forma correcta'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }

    public function show(Dependencia $dependencia)
    {
        return response()->JSON([
            'sw' => true,
            'dependencia' => $dependencia
        ], 200);
    }
    public function destroy(Dependencia $dependencia)
    {
        DB::beginTransaction();
        try {
            $datos_original = HistorialAccion::getDetalleRegistro($dependencia, "dependencias");
            $dependencia->delete();
            HistorialAccion::create([
                'user_id' => Auth::user()->id,
                'accion' => 'ELIMINACIÓN',
                'descripcion' => 'EL DEPENDENCIA ' . Auth::user()->dependencia . ' ELIMINÓ UN DEPENDENCIA',
                'datos_original' => $datos_original,
                'modulo' => 'USUARIOS',
                'fecha' => date('Y-m-d'),
                'hora' => date('H:i:s')
            ]);

            DB::commit();
            return response()->JSON([
                'sw' => true,
                'msj' => 'El registro se eliminó correctamente'
            ], 200);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->JSON([
                'sw' => false,
                'message' => $e->getMessage(),
            ], 500);
        }
    }
}
