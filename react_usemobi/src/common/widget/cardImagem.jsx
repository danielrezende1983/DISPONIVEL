import React from 'react';
import Grid from '../layout/grid'
import { Card, CardHeader, CardBody, CardFooter } from 'react-simple-card';
import IconeAplicativo from './iconeAplicativo'
 
export default props => (
    <Grid cols={props.cols}>
        <Card>            
            <CardHeader>
                <div className="centralizar-imagem">
                    <IconeAplicativo imagem={props.icone} />
                </div>                
            </CardHeader>
            <CardBody>{props.nomeAplicativo}</CardBody>
            <CardFooter>{props.descricao}</CardFooter>
        </Card>
    </Grid>
)