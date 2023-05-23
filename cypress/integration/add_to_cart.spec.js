
describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })
  it('displays the list of all products in homepage', () => {
    cy.get(".products article").should("be.visible");
  })
  it('should increase the cart quantity', () => {
    let initialQuantity = 0;
    cy.get('.products article').first().within(() => {
     cy.contains('Add').click({ force: true });
    });
    cy.get('.nav-link').contains('My Cart').click();

    cy.get('.cart-show tbody tr').its('length').as('updatedQuantity');

    cy.get('@updatedQuantity').then((updatedQuantity) => {
      expect(updatedQuantity).to.eq(initialQuantity + 1);
    });
  });
  
})