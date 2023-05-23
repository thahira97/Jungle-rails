
describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })
  it('displays the list of all products in homepage', () => {
    cy.get(".products article").should("be.visible");
  })
  it('should navigate to product detail page', () => {
    cy.get('.products article').first().within(() => {
      cy.get('a').click();
    });

    cy.url().should('include', '/products/');
    
  });
})