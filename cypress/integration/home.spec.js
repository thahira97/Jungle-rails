
describe('example to-do app', () => {
  beforeEach(() => {
    cy.visit('http://localhost:3000/')
  })
  it('displays the list of all products in homepage', () => {
    cy.get(".products article").should("be.visible");
  })
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
})