<?php

namespace app\controllers;

use yii\filters\AccessControl;
use yii\web\Controller;

class CarritosController extends Controller
{

    public function behaviors()
    {
        return [
            'access' => [
                '__class' => AccessControl::class,
                // 'only' => ['ver', 'meter', 'vaciar'], si no lo pones es a todas las acciones
                'rules' => [
                    [
                        // 'actions' => ['ver', 'meter', 'vaciar'], si no lo pones es a todas las acciones
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ];
    }

    public function actionVer()
    {

    }

    public function actionMeter($id)
    {

    }

    public function actionVaciar()
    {

    }
}