package net.faiyaz.model;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
@Path("/customers")
public class JsonFromRestful
{
    @GET
    @Path("/{cusNo}")
    @Produces(MediaType.APPLICATION_JSON)
    public Customer produceCustomerDetailsinJSON(@PathParam("cusNo") int no) 
    {
 
        
        Customer cust = new Customer();        
        cust .setCustNo(no);
        cust .setCustName("Java4s");
        cust .setCustCountry("India");
        return cust;
    }
}