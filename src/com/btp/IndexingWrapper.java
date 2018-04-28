package com.btp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
//import java.util.HashSet;
import java.util.List;
//import java.util.Random;
//import java.util.Set;
//import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.annotation.Nullable;



import com.google.appengine.api.search.Cursor;
import com.google.appengine.api.search.Document;
import com.google.appengine.api.search.Document.Builder;
import com.google.appengine.api.search.Field;
import com.google.appengine.api.search.GetRequest;
import com.google.appengine.api.search.GetResponse;
import com.google.appengine.api.search.Index;
import com.google.appengine.api.search.IndexSpec;
import com.google.appengine.api.search.OperationResult;
import com.google.appengine.api.search.PutException;
import com.google.appengine.api.search.Results;
import com.google.appengine.api.search.ScoredDocument;
import com.google.appengine.api.search.SearchException;
import com.google.appengine.api.search.SearchServiceFactory;
import com.google.appengine.api.search.StatusCode;
//import com.google.appengine.repackaged.com.google.api.client.util.Lists;
import com.google.common.base.Function;
//import com.google.common.base.Joiner;
//import com.google.common.base.Predicate;
import com.google.common.collect.Iterables;
import com.google.common.collect.Lists;
import com.googlecode.objectify.Key;

public class IndexingWrapper {
	private static final Logger LOGGER = Logger.getLogger(IndexingWrapper.class.getName());
	  public static final String TESTIMONIAL_INDEX = "testimonial";

	  @SuppressWarnings("serial")
	  public static class SearchResult<T> extends Results<T> {
	    protected SearchResult(OperationResult operationResult, Collection<T> results, long numberFound, int numberReturned,
	        Cursor cursor) {
	      super(operationResult, results, numberFound, numberReturned, cursor);
	    }
	  }

	  public static void createAndIndexDocumentForTestimonial(@Nullable Long testimonialId) throws IOException {
	    Document doc = createDocumentForTestimonial(testimonialId);
	    try {
	      indexDocuments(TESTIMONIAL_INDEX, doc);
	    } catch (InterruptedException e) {
	      throw new IOException(e);
	    }
	  }

	  public static SearchResult<Testimonial> searchTestimonial(String searchTerm) {
	    Results<ScoredDocument> documents = IndexingWrapper.getDocumentsFor(TESTIMONIAL_INDEX, searchTerm);
	    Iterable<String> testimonialIds = Iterables.transform(documents, new Function<ScoredDocument, String>() {
	      @Override
	      public String apply(ScoredDocument doc) {
	        return doc.getId();
	      }
	    });
	    List<Key<Testimonial>> testimonialKeys = new ArrayList<Key<Testimonial>>();
	    for(String testimonialId: testimonialIds){
	    	testimonialKeys.add(Key.create(Testimonial.class,Long.parseLong(testimonialId) ));
	    }
	    List<Testimonial> testimonials = Iterables.isEmpty(testimonialIds) ? Lists.<Testimonial>newArrayList()
	        :new ArrayList<Testimonial>(OfyService.ofy().load().keys(testimonialKeys).values());

	    return new SearchResult<Testimonial>(documents.getOperationResult(), testimonials, documents.getNumberFound(),
	        documents.getNumberReturned(), documents.getCursor());
	  }

	  public static void clean(String indexName) {
	    Index index = getIndex(indexName);

	    // Looping because getRange by default returns up to 100 documents at a time
	    while (true) {
	      List<String> docIds = new ArrayList<>();
	      // Return a set of doc_ids.
	      GetRequest request = GetRequest.newBuilder().setReturningIdsOnly(true).build();
	      GetResponse<Document> response = index.getRange(request);
	      if (response.getResults().isEmpty()) {
	        break;
	      }
	      for (Document doc : response) {
	        docIds.add(doc.getId());
	      }
	      index.delete(docIds);
	    }
	  }

	  private static Results<ScoredDocument> getDocumentsFor(String indexName, String searchTerm) {
	    final int maxRetry = 3;
	    int attempts = 0;
	    int delay = 2;
	    while (true) {
	      try {
	        Results<ScoredDocument> results = getIndex(indexName).search(searchTerm);
	        return results;
	      } catch (SearchException e) {
	        if (StatusCode.TRANSIENT_ERROR.equals(e.getOperationResult().getCode()) && ++attempts < maxRetry) {
	          // retry
	          try {
	            Thread.sleep(delay * 1000);
	          } catch (InterruptedException e1) {
	            // ignore
	          }
	          delay *= 2; // easy exponential backoff
	          continue;
	        } else {
	          throw e;
	        }
	      }
	    }
	  }

	  private static Index getIndex(String indexName) {
	    IndexSpec indexSpec = IndexSpec.newBuilder().setName(indexName).build();
	    return SearchServiceFactory.getSearchService().getIndex(indexSpec);
	  }

	  private static Document createDocumentForTestimonial(Testimonial testimonial, User user) {
		  

//	    int payoutLast6Months = (int) NjutaOrganizerPayment.getTotalPaymentForOrganizer(orgAccount.accountId,
//	        System.currentTimeMillis() - TimeUnit.DAYS.toMillis(180), System.currentTimeMillis());
//	    int rank = new Random().nextInt(100) + (orgAccount.isPrimary ? 10000 : 0) + payoutLast6Months;

	    Builder docBuilder = Document.newBuilder().setId(String.valueOf(testimonial.Id))
	        .addField(Field.newBuilder().setName("diseaseName").setText(testimonial.getDiseaseName()))
	        .addField(Field.newBuilder().setName("userEmail").setText(testimonial.getUserEmail()))
	        .addField(Field.newBuilder().setName("patientEmail").setText(testimonial.getPatientEmail()))
	        .addField(Field.newBuilder().setName("pathy").setText(testimonial.getPathy()))
	        .addField(Field.newBuilder().setName("year").setNumber(testimonial.getYear()));
	    
	    if(user!=null && user.getFirstName()!=null){
	    	docBuilder.addField(Field.newBuilder().setName("userName").setText(user.getFirstName()));
	    }
	    
	   
	    return docBuilder.build();
	  }

	  private static Document createDocumentForTestimonial(Testimonial t) {
	    return createDocumentForTestimonial(t, Database.getByEmail(t.getUserEmail()));
	  }

	  private static Document createDocumentForTestimonial(Long testimonialId) throws IOException {
	    if (testimonialId == null) {
	      LOGGER.log(Level.WARNING, "testimonial id is null");
	      throw new IOException("testimonial id is null");
	    }

	    Testimonial testimonial = Database.getTestimonialById(testimonialId);
	    if (testimonial == null) {
	      LOGGER.log(Level.WARNING, "testimonial account not found");
	      throw new IOException("testimonial account not found");
	    }

	    return createDocumentForTestimonial(testimonial);
	  }

	  private static void indexDocuments(String indexName, Document... documents) throws InterruptedException {
	    Index index = getIndex(indexName);
	    final int maxRetry = 3;
	    int attempts = 0;
	    int delay = 2;
	    while (true) {
	      try {
	        index.put(documents);
	      } catch (PutException e) {
	        if (StatusCode.TRANSIENT_ERROR.equals(e.getOperationResult().getCode()) && ++attempts < maxRetry) { // retrying
	          Thread.sleep(delay * 1000);
	          delay *= 2; // easy exponential backoff
	          continue;
	        } else {
	          throw e; // otherwise throw
	        }
	      }
	      break;
	    }
	  }



}
