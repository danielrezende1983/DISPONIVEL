import React from 'react';
import Grid from '../layout/grid'
import { Card, CardHeader, CardBody, CardFooter } from 'react-simple-card';
 
export default props => (
    <Grid cols={props.cols}>
        <Card>
            <CardHeader>{props.header}</CardHeader>
            <CardBody>{props.body}</CardBody>
            <CardFooter>{props.footer}</CardFooter>
        </Card>
    </Grid>
)