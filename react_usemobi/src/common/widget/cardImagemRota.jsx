import React from 'react';
import { Router, Route, Redirect, hashHistory } from 'react-router'
import Grid from '../layout/grid'
import { Card, CardHeader, CardBody, CardFooter } from 'react-simple-card';

import IconeAplicativo from './iconeAplicativo'
 
export default props => (
    <Grid cols={props.cols}>
        <a href={props.path}>
            <Card>            
                <CardHeader>
                    <div className="centralizar-imagem">
                        <IconeAplicativo imagem={props.icone} />
                    </div>                
                </CardHeader>
                <CardBody>{props.nomeAplicativo}</CardBody>
                <CardFooter>{props.descricao}</CardFooter>
            </Card>
        </a>        
    </Grid>
)
