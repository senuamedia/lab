; ModuleID = 'simplex_program'
target triple = "x86_64-apple-macosx14.0.0"

declare ptr @malloc(i64)
declare void @free(ptr)
declare void @intrinsic_println(ptr)
declare void @intrinsic_print(ptr)
declare void @"print_i64"(i64)
declare ptr @intrinsic_int_to_string(i64)
declare ptr @intrinsic_string_new(ptr)
declare ptr @intrinsic_string_from_char(i64)
declare i64 @intrinsic_string_len(ptr)
declare ptr @intrinsic_string_concat(ptr, ptr)
declare ptr @intrinsic_string_slice(ptr, i64, i64)
declare i64 @intrinsic_string_char_at(ptr, i64)
declare i1 @intrinsic_string_eq(ptr, ptr)
declare i64 @intrinsic_string_to_int(ptr)
declare i64 @"String_from"(i64)
declare i64 @"String_len"(i64)
declare ptr @intrinsic_vec_new()
declare void @intrinsic_vec_push(ptr, ptr)
declare ptr @intrinsic_vec_get(ptr, i64)
declare i64 @intrinsic_vec_len(ptr)
declare void @intrinsic_vec_set(ptr, i64, ptr)
declare ptr @intrinsic_vec_pop(ptr)
declare void @intrinsic_vec_clear(ptr)
declare void @intrinsic_vec_remove(ptr, i64)
declare ptr @intrinsic_get_args()
declare ptr @intrinsic_read_file(ptr)
declare void @intrinsic_write_file(ptr, ptr)
declare ptr @store_ptr(ptr, i64, ptr)
declare ptr @store_i64(ptr, i64, i64)
declare ptr @load_ptr(ptr, i64)
declare i64 @load_i64(ptr, i64)
; Timing intrinsics
declare i64 @intrinsic_get_time_ms()
declare i64 @intrinsic_get_time_us()
declare i64 @intrinsic_get_time_ns()
; Float bit conversion intrinsics
declare i64 @"f64_to_bits"(double)
declare i64 @"bits_to_f64"(i64)
; Arena allocator intrinsics
declare ptr @intrinsic_arena_create(i64)
declare ptr @intrinsic_arena_alloc(ptr, i64)
declare void @intrinsic_arena_reset(ptr)
declare void @intrinsic_arena_free(ptr)
declare i64 @intrinsic_arena_used(ptr)
; StringBuilder intrinsics
declare ptr @intrinsic_sb_new()
declare ptr @intrinsic_sb_new_cap(i64)
declare void @intrinsic_sb_append(ptr, ptr)
declare void @intrinsic_sb_append_char(ptr, i64)
declare void @intrinsic_sb_append_i64(ptr, i64)
declare ptr @intrinsic_sb_to_string(ptr)
declare void @intrinsic_sb_clear(ptr)
declare void @intrinsic_sb_free(ptr)
declare i64 @intrinsic_sb_len(ptr)
; File I/O intrinsics
declare ptr @intrinsic_getenv(ptr)
declare i64 @intrinsic_file_exists(ptr)
declare i64 @intrinsic_is_file(ptr)
declare i64 @intrinsic_is_directory(ptr)
declare i64 @intrinsic_file_size(ptr)
declare i64 @intrinsic_file_mtime(ptr)
declare i64 @intrinsic_remove_path(ptr)
declare i64 @intrinsic_mkdir_p(ptr)
declare ptr @intrinsic_get_cwd()
declare i64 @intrinsic_set_cwd(ptr)
declare ptr @intrinsic_list_dir(ptr)
declare ptr @intrinsic_path_join(ptr, ptr)
declare ptr @intrinsic_path_dirname(ptr)
declare ptr @intrinsic_path_basename(ptr)
declare ptr @intrinsic_path_extension(ptr)
declare i64 @file_copy(ptr, ptr)
declare i64 @file_rename(ptr, ptr)
declare void @stderr_write(ptr)
declare void @stderr_writeln(ptr)
; Error handling intrinsics
declare void @intrinsic_panic(ptr)
declare void @intrinsic_print_stack_trace()
; Process intrinsics
declare i64 @intrinsic_process_run(ptr)
declare ptr @intrinsic_process_output(ptr)
; Phase 20: REPL/I/O intrinsics
declare ptr @intrinsic_read_line()
declare i64 @intrinsic_is_tty()
declare i64 @intrinsic_stdin_has_data()
declare i64 @intrinsic_string_hash(ptr)
declare i64 @intrinsic_string_find(ptr, ptr, i64)
declare ptr @intrinsic_string_trim(ptr)
declare ptr @intrinsic_string_split(ptr, ptr)
declare i64 @intrinsic_string_starts_with(ptr, ptr)
declare i64 @intrinsic_string_ends_with(ptr, ptr)
declare i64 @intrinsic_string_contains(ptr, ptr)
declare ptr @intrinsic_string_replace(ptr, ptr, ptr)
declare ptr @intrinsic_string_lines(ptr)
declare ptr @intrinsic_string_join(ptr, ptr)
declare ptr @intrinsic_string_to_lowercase(ptr)
declare ptr @intrinsic_string_to_uppercase(ptr)
declare i64 @intrinsic_string_compare(ptr, ptr)
declare i64 @intrinsic_copy_file(ptr, ptr)
declare ptr @intrinsic_get_home_dir()
declare i64 @cli_getenv(i64)
declare i64 @"env_get"(i64)
declare i64 @file_read(i64)
declare void @file_write(i64, i64)
declare i64 @remove_path(i64)
declare i64 @f64_parse(ptr)
declare i64 @"make_sx_string"(i64)
; SLM native bindings
declare i64 @"slm_native_load"(i64, i64, i64)
declare i64 @"slm_native_unload"(i64)
declare i64 @"slm_native_create_context"(i64, i64)
declare i64 @"slm_native_destroy_context"(i64)
declare i64 @"slm_native_tokenize"(i64, i64)
declare i64 @"slm_native_infer"(i64, i64, i64)
declare i64 @"slm_native_generate"(i64, i64, i64, i64)
declare i64 @"slm_native_embed"(i64, i64)
declare i64 @"slm_native_similarity"(i64, i64)
declare i64 @"slm_native_context_size"(i64)
declare i64 @"slm_native_embedding_size"(i64)
declare i64 @"slm_native_get_model_info"(i64)
; Generator intrinsics
declare i64 @generator_yield(i64)
declare i64 @generator_new(i64)
declare i64 @generator_next(i64)
declare i64 @generator_done(i64)
; Belief guard intrinsics
declare i64 @belief_guard_get_confidence(i64)
declare i64 @belief_guard_get_derivative(i64)
declare i64 @belief_register(i64, double, double)
declare i64 @belief_update(i64, double)
declare i64 @belief_update_dual(i64, double, double)
declare double @belief_get_value(i64)
declare i64 @belief_register_i64(i64, i64, i64)
declare i64 @belief_update_i64(i64, i64)
declare i64 @belief_update_dual_i64(i64, i64, i64)
; Belief suspend/wake intrinsics
declare i64 @belief_suspend_receive(i64, i64, i64, i64, i64, double, i64, i64)
declare i64 @belief_cancel_suspend(i64)
declare i64 @belief_suspended_count()
declare i64 @belief_get_actor_suspends(i64)
declare i64 @belief_clear_actor_suspends(i64)
declare i64 @belief_suspend_get_belief(i64)
declare i64 @belief_suspend_get_actor(i64)
declare i64 @belief_suspend_get_duration_ms(i64)
declare i64 @future_poll(i64)
declare i64 @future_ready(i64)
declare i64 @future_pending()
declare i64 @executor_run(i64)
declare i64 @executor_spawn(i64)
declare i64 @block_on(i64)
declare i64 @async_join(i64, i64)
declare i64 @join_result1(i64)
declare i64 @join_result2(i64)
declare i64 @async_select(i64, i64)
declare i64 @select_result(i64)
declare i64 @select_which(i64)
declare i64 @async_timeout(i64, i64)
declare i64 @timeout_result(i64)
declare i64 @timeout_expired(i64)
declare i64 @time_now_ms()
declare i64 @pin_new(i64, i64)
declare i64 @pin_new_uninit(i64)
declare i64 @pin_get(i64)
declare i64 @pin_get_mut(i64)
declare i64 @pin_is_pinned(i64)
declare void @pin_ref(i64)
declare void @pin_unref(i64)
declare void @pin_set_self_ref(i64, i64)
declare i64 @pin_check_self_ref(i64, i64)
declare i64 @intrinsic_call0(i64)
declare i64 @intrinsic_call1(i64, i64)
declare i64 @intrinsic_call2(i64, i64, i64)
declare i64 @intrinsic_call3(i64, i64, i64, i64)
declare i64 @scope_new()
declare i64 @scope_spawn(i64, i64)
declare i64 @scope_poll(i64)
declare i64 @scope_join(i64)
declare i64 @scope_get_result(i64, i64)
declare void @scope_cancel(i64)
declare i64 @scope_count(i64)
declare i64 @scope_completed(i64)
declare void @scope_free(i64)
declare i64 @nursery_run(i64, i64)
declare i64 @actor_get_status(i64)
declare i64 @actor_get_exit_reason(i64)
declare i64 @actor_get_error_code(i64)
declare void @actor_set_error(i64, i64, i64)
declare void @actor_stop(i64)
declare void @actor_kill(i64)
declare void @actor_crash(i64, i64, i64)
declare void @actor_set_on_error(i64, i64)
declare void @actor_set_on_exit(i64, i64)
declare void @actor_set_supervisor(i64, i64)
declare i64 @actor_get_supervisor(i64)
declare i64 @actor_get_restart_count(i64)
declare void @actor_increment_restart(i64)
declare i64 @actor_is_alive(i64)
declare i64 @circuit_breaker_new(i64, i64, i64)
declare i64 @circuit_breaker_allow(i64)
declare void @circuit_breaker_success(i64)
declare void @circuit_breaker_failure(i64)
declare i64 @circuit_breaker_state(i64)
declare void @circuit_breaker_reset(i64)
declare i64 @retry_policy_new(i64, i64, i64, i64)
declare void @retry_policy_set_jitter(i64, i64)
declare i64 @retry_policy_should_retry(i64)
declare i64 @retry_policy_next_delay(i64)
declare void @retry_policy_reset(i64)
declare i64 @retry_policy_count(i64)
declare i64 @actor_link(i64, i64)
declare void @actor_unlink(i64, i64)
declare i64 @actor_monitor(i64, i64)
declare void @actor_demonitor(i64)
declare void @actor_propagate_exit(i64, i64)
declare i64 @actor_is_linked(i64, i64)
declare i64 @actor_spawn_link(i64, i64, i64)
declare i64 @actor_get_links_count(i64)
declare i64 @actor_send_down(i64, i64, i64)
; Phase 23.1: Supervision Trees
declare i64 @supervisor_new(i64, i64, i64)
declare i64 @supervisor_add_child(i64, i64, i64, i64, i64)
declare i64 @supervisor_start(i64)
declare void @supervisor_stop(i64)
declare i64 @supervisor_handle_exit(i64, i64, i64)
declare i64 @supervisor_child_count(i64)
declare i64 @supervisor_child_status(i64, i64)
declare i64 @supervisor_child_handle(i64, i64)
declare void @supervisor_free(i64)
declare i64 @strategy_one_for_one()
declare i64 @strategy_one_for_all()
declare i64 @strategy_rest_for_one()
declare i64 @child_permanent()
declare i64 @child_temporary()
declare i64 @child_transient()
; Phase 23.2: Work-Stealing Scheduler
declare i64 @scheduler_new(i64)
declare i64 @scheduler_start(i64)
declare i64 @scheduler_submit(i64, i64, i64)
declare i64 @scheduler_submit_local(i64, i64, i64, i64)
declare void @scheduler_stop(i64)
declare void @scheduler_free(i64)
declare i64 @scheduler_worker_count(i64)
declare i64 @scheduler_queue_size(i64)
declare i64 @scheduler_worker_idle(i64, i64)
; Phase 23.3: Lock-Free Mailbox
declare i64 @mailbox_new(i64)
declare i64 @mailbox_send(i64, i64)
declare i64 @mailbox_ask(i64, i64)
declare i64 @mailbox_recv(i64)
declare i64 @mailbox_try_recv(i64)
declare i64 @mailbox_size(i64)
declare i64 @mailbox_empty(i64)
declare i64 @mailbox_full(i64)
declare void @mailbox_close(i64)
declare i64 @mailbox_is_closed(i64)
declare void @mailbox_free(i64)
; Phase 23.6: Actor Discovery and Registry
declare i64 @registry_register(i64, i64)
declare void @registry_unregister(i64)
declare i64 @registry_lookup(i64)
declare i64 @registry_count()
declare i64 @registry_set_metadata(i64, i64)
declare i64 @registry_get_metadata(i64)
; Phase 23.7: Backpressure and Flow Control
declare i64 @flow_controller_new(i64, i64, i64)
declare i64 @flow_check(i64)
declare i64 @flow_acquire(i64)
declare void @flow_release(i64)
declare i64 @flow_is_signaling(i64)
declare i64 @flow_current(i64)
declare i64 @flow_high_watermark(i64)
declare i64 @flow_low_watermark(i64)
declare void @flow_reset(i64)
declare void @flow_free(i64)
declare i64 @flow_mode_drop()
declare i64 @flow_mode_block()
declare i64 @flow_mode_signal()
declare void @intrinsic_exit(i64)
; Phase 1 Stdlib: Option
declare i64 @"option_some"(i64)
declare i64 @"option_none"()
declare i64 @"option_is_some"(i64)
declare i64 @"option_is_none"(i64)
declare i64 @"option_unwrap"(i64)
declare i64 @"option_expect"(i64, i64)
declare i64 @"option_unwrap_or"(i64, i64)
declare i64 @"option_map"(i64, i64)
; Phase 1 Stdlib: Result
declare i64 @"result_ok"(i64)
declare i64 @"result_err"(i64)
declare i64 @"result_is_ok"(i64)
declare i64 @"result_is_err"(i64)
declare i64 @"result_unwrap"(i64)
declare i64 @"result_unwrap_err"(i64)
declare i64 @"result_unwrap_or"(i64, i64)
declare i64 @"result_ok_or"(i64, i64)
; Phase 1 Stdlib: Vec extensions
declare i64 @"vec_sum"(i64)
declare i64 @"vec_find"(i64, i64)
declare i64 @"vec_contains"(i64, i64)
declare i64 @"vec_reverse"(i64)
declare i64 @"vec_clone"(i64)
declare i64 @"vec_first"(i64)
declare i64 @"vec_last"(i64)
declare i64 @"vec_pop"(i64)
declare i64 @"vec_set"(i64, i64, i64)
declare i64 @"vec_clear"(i64)
declare i64 @"vec_remove"(i64, i64)
; Phase 1 Stdlib: HashMap
declare i64 @"hashmap_new"()
declare i64 @"hashmap_insert"(i64, i64, i64)
declare i64 @"hashmap_get"(i64, i64)
declare i64 @"hashmap_remove"(i64, i64)
declare i64 @"hashmap_contains"(i64, i64)
declare i64 @"hashmap_len"(i64)
declare i64 @"hashmap_clear"(i64)
declare i64 @"hashmap_keys"(i64)
declare i64 @"hashmap_values"(i64)
; Phase 1 Stdlib: HashSet
declare i64 @"hashset_new"()
declare i64 @"hashset_insert"(i64, i64)
declare i64 @"hashset_remove"(i64, i64)
declare i64 @"hashset_contains"(i64, i64)
declare i64 @"hashset_len"(i64)
declare i64 @"hashset_clear"(i64)
; Phase 1 Stdlib: JSON
declare i64 @"json_parse_simple"(i64)
declare i64 @"json_stringify"(i64)
declare i64 @"json_get_sx"(i64, i64)
declare i64 @"json_keys"(i64)
declare i64 @"json_is_string"(i64)
declare i64 @"json_is_object"(i64)
declare i64 @"json_is_array"(i64)
declare i64 @"json_as_string"(i64)
declare i64 @"json_as_array"(i64)
declare i64 @"json_object_new"()
declare i64 @"json_array_new"()
declare i64 @"json_object_set"(i64, i64, i64)
declare i64 @"json_array_push"(i64, i64)
declare i64 @"json_string"(i64)
declare i64 @"json_string_sx"(i64)
declare i64 @"json_array_len"(i64)
declare i64 @"json_object_len"(i64)
declare i64 @"json_as_i64"(i64)
declare i64 @"json_get_index"(i64, i64)
declare i64 @"json_is_null"(i64)
declare i64 @"json_object_key_at"(i64, i64)
declare i64 @"json_object_value_at"(i64, i64)
declare i64 @"json_object_set_sx"(i64, i64, i64)
; Phase 3: HTTP Client/Server
declare i64 @"http_request_new"(i64, i64)
declare i64 @"http_request_header"(i64, i64, i64)
declare i64 @"http_request_body"(i64, i64)
declare i64 @"http_request_send"(i64)
declare i64 @"http_request_free"(i64)
declare i64 @"http_response_status"(i64)
declare i64 @"http_response_body"(i64)
declare i64 @"http_response_header"(i64, i64)
declare i64 @"http_response_free"(i64)
declare i64 @"http_server_new"(i64)
declare i64 @"http_server_route"(i64, i64, i64, i64)
declare i64 @"http_server_start"(i64)
declare i64 @"http_server_stop"(i64)
declare i64 @"http_server_free"(i64)
; Phase 3: SQL Database
declare i64 @"sql_open"(i64)
declare void @"sql_close"(i64)
declare i64 @"sql_exec"(i64, i64)
declare i64 @"sql_query"(i64, i64)
declare i64 @"sql_prepare"(i64, i64)
declare i64 @"sql_bind_int"(i64, i64, i64)
declare i64 @"sql_bind_text"(i64, i64, i64)
declare i64 @"sql_bind_float"(i64, i64, double)
declare i64 @"sql_bind_null"(i64, i64)
declare i64 @"sql_bind_blob"(i64, i64, i64, i64)
declare i64 @"sql_step"(i64)
declare i64 @"sql_column_int"(i64, i64)
declare i64 @"sql_column_text"(i64, i64)
declare double @"sql_column_float"(i64, i64)
declare i64 @"sql_column_blob"(i64, i64)
declare i64 @"sql_column_blob_len"(i64, i64)
declare i64 @"sql_column_is_null"(i64, i64)
declare void @"sql_finalize"(i64)
declare i64 @"sql_begin"(i64)
declare i64 @"sql_commit"(i64)
declare i64 @"sql_rollback"(i64)
declare i64 @"sql_last_insert_id"(i64)
; Phase 3: UUID
declare i64 @"uuid_v4"()
declare i64 @"uuid_nil"()
declare i64 @"uuid_is_nil"(i64)
declare i64 @"uuid_is_valid"(i64)
; Phase 3: TOML
declare i64 @"toml_parse"(i64)
declare i64 @"toml_get"(i64, i64)
declare i64 @"toml_get_string"(i64, i64)
declare i64 @"toml_get_int"(i64, i64)
declare double @"toml_get_float"(i64, i64)
declare i64 @"toml_get_bool"(i64, i64)
declare i64 @"toml_get_array"(i64, i64)
declare i64 @"toml_get_table"(i64, i64)
declare i64 @"toml_set_string"(i64, i64, i64)
declare i64 @"toml_set_int"(i64, i64, i64)
declare i64 @"toml_set_float"(i64, i64, double)
declare i64 @"toml_set_bool"(i64, i64, i64)
declare i64 @"toml_stringify"(i64)
declare i64 @"toml_table_new"()
declare i64 @"toml_free"(i64)
; Phase G: AI Features
declare i64 @model_infer(i64)
declare i64 @model_load(i64)
declare i64 @model_embed(i64, i64)
declare i64 @model_classify(i64, i64)
declare void @model_unload(i64)
; AI Vector Operations
declare i64 @vector_new(i64, i64)
declare i64 @vector_len(i64)
declare double @vector_get(i64, i64)
declare void @vector_set(i64, i64, double)
declare double @vector_dot(i64, i64)
declare i64 @vector_add(i64, i64)
declare i64 @vector_sub(i64, i64)
declare i64 @vector_scale(i64, double)
declare double @vector_norm(i64)
declare i64 @vector_normalize(i64)
declare double @vector_cosine_similarity(i64, i64)
; AI Tensor Operations
declare i64 @tensor_new(i64, i64)
declare i64 @tensor_shape(i64)
declare i64 @tensor_rank(i64)
declare double @tensor_get(i64, i64)
declare void @tensor_set(i64, i64, double)
declare i64 @tensor_matmul(i64, i64)
declare i64 @tensor_add(i64, i64)
declare i64 @tensor_transpose(i64)
declare i64 @tensor_reshape(i64, i64)
; Specialist Operations
declare i64 @specialist_query(i64, i64)
declare i64 @specialist_stream(i64, i64)
declare void @specialist_set_context(i64, i64)
declare i64 @specialist_get_context(i64)
; Hive Operations
declare i64 @hive_route(i64, i64)
declare void @hive_add_specialist(i64, i64)
declare void @hive_remove_specialist(i64, i64)
declare i64 @hive_consensus(i64, i64)
declare i64 @"sx_int_to_f64"(i64)
declare i64 @"sx_f64_to_int"(i64)
declare i64 @"sx_f64_add"(i64, i64)
declare i64 @"sx_f64_sub"(i64, i64)
declare i64 @"sx_f64_mul"(i64, i64)
declare i64 @"sx_f64_div"(i64, i64)
declare i64 @"sx_f64_mod"(i64, i64)
declare i64 @"sx_f64_gt"(i64, i64)
declare i64 @"sx_f64_lt"(i64, i64)
declare i64 @"sx_f64_ge"(i64, i64)
declare i64 @"sx_f64_le"(i64, i64)
declare i64 @"sx_f64_eq"(i64, i64)
declare i64 @"sx_f64_ne"(i64, i64)
declare i64 @"f64_neg"(i64)
declare i64 @"json_parse"(i64)
declare i64 @"json_get"(i64, i64)
declare i64 @"json_set"(i64, i64, i64)
declare i64 @"string_from"(i64)
declare i64 @"infer"(i64, i64)
declare i64 @"path_exists"(i64)
declare i64 @"tanh_f64"(i64)
declare i64 @"contract_result_violation_type"(i64)
declare i64 @"activation_record"(i64, i64)
declare i64 @"neural_reset_pruning"()
declare i64 @"device_type"(i64)
declare i64 @"lazy_branch_count"(i64)
declare i64 @"lazy_context_new"()
declare i64 @"lazy_context_free"(i64)
declare i64 @"lazy_dominant_branch"(i64)
declare i64 @"lazy_executed_count"(i64)
declare i64 @"lazy_mark_executed"(i64, i64)
declare i64 @"lazy_should_execute"(i64, i64)
declare i64 @"activation_tracker_init"()
declare i64 @"activation_tracking_enabled"()
declare i64 @"neural_gate_new"(i64, i64, i64, i64)
declare i64 @"neural_gate_with_contract"(i64, i64, i64, i64, i64)
declare i64 @"neural_gate_execute_on_device"(i64, i64, i64)
declare i64 @"gate_bind_device"(i64, i64)
declare i64 @"gate_get_device"(i64)
declare i64 @"gate_has_explicit_binding"(i64)
declare i64 @"dead_path_analyzer_new"()
declare i64 @"dead_path_analyzer_free"(i64)
declare i64 @"dead_path_add_edge"(i64, i64, i64)
declare i64 @"dead_path_mark_entry"(i64, i64)
declare i64 @"dead_path_propagate"(i64)
declare i64 @"dead_path_reachable_count"(i64)
declare i64 @"graph_new"()
declare i64 @"graph_free"(i64)
declare i64 @"graph_add_node"(i64, i64)
declare i64 @"graph_add_edge"(i64, i64, i64)
declare i64 @"graph_partition"(i64, i64)
declare i64 @"graph_partition_count"(i64)
declare i64 @"graph_partition_device"(i64, i64)
declare i64 @"pruning_context_new"()
declare i64 @"pruning_context_free"(i64)
declare i64 @"pruning_add_gate"(i64, i64, i64)
declare i64 @"pruning_execute"(i64)
declare i64 @"pruning_is_pruned"(i64, i64)
declare i64 @"pruning_ratio"(i64)
declare i64 @"pruning_reason"(i64, i64)
declare i64 @"pruning_total_count"(i64)
declare i64 @"structured_pruner_new"()
declare i64 @"structured_pruner_free"(i64)
declare i64 @"speculative_context_new"()
declare i64 @"speculative_context_free"(i64)
declare i64 @"speculative_add_branch"(i64, i64, i64)
declare i64 @"speculative_get_result"(i64, i64)
declare i64 @"speculative_set_result"(i64, i64, i64)
declare i64 @"speculative_weighted_result"(i64)
declare i64 @"speculative_memory_used"(i64)
declare i64 @"speculative_gc"(i64)
declare i64 @"optimization_stats_calculate"(i64, i64)
declare i64 @"optimization_stats_free"(i64)
declare i64 @"optimization_speedup"(i64)
declare i64 @"optimization_size_reduction"(i64)
declare i64 @"dual_variable"(i64)
declare i64 @"dual_constant"(i64)
declare i64 @"dual_add"(i64, i64)
declare i64 @"dual_mul"(i64, i64)
declare i64 @"dual_div"(i64, i64)
declare i64 @"dual_mul_scalar"(i64, i64)
declare i64 @"dual_sin"(i64)
declare i64 @"dual_cos"(i64)
declare i64 @"dual_exp"(i64)
declare i64 @"dual_ln"(i64)
declare i64 @"dual_sqrt"(i64)
declare i64 @"dual_tanh"(i64)
declare i64 @"dual_sigmoid"(i64)
declare i64 @"dual_powi"(i64, i64)
declare i64 @"int_hashset_new"()
declare i64 @"int_hashset_insert"(i64, i64)
declare i64 @"int_hashset_contains"(i64, i64)
declare i64 @"int_hashset_len"(i64)
declare i64 @"not_approx_eq"(i64, i64, i64)
declare i64 @"transfer_queue_init"(i64)
declare i64 @"sxiter_from_vec"(i64)
declare i64 @"sxiter_collect_vec"(i64)
declare i64 @"sxiter_filter"(i64, i64)
declare i64 @"wref_registry_init"()
declare i64 @"wref_new"(i64, i64, i64)
declare i64 @"wref_ptr"(i64)
declare i64 @"wref_weight"(i64)
declare i64 @"wref_count"()
declare i64 @"wref_state"(i64)
declare i64 @"wref_retain"(i64)
declare i64 @"wref_release"(i64)
declare i64 @"wref_is_allocated"(i64)
declare i64 @"wref_collapse"(i64)
declare i64 @"wref_set_weight"(i64, i64)
declare i64 @"wref_set_mode"(i64)
declare i64 @"wref_get_mode"()
declare i64 @"wref_set_weight_threshold"(i64)
declare i64 @"wref_get_weight_threshold"()
declare i64 @"wref_gc"()
declare i64 @"wref_gc_total_runs"()
declare i64 @"wref_gc_total_collected"()
declare i64 @"wref_gc_last_collected"()
declare i64 @"wref_bytes_allocated"()
declare i64 @"device_registry_init"()
declare i64 @"contract_violation_count"()
declare i64 @"contract_set_violation_handler"(i64)
declare i64 @"neural_gate_weight"(i64)
declare i64 @"lazy_eval"(i64)
declare i64 @"lazy_best_branch"(i64)
declare i64 @"print_f64"(i64)
declare i64 @"device_register"(i64, i64, i64, i64, i64, i64)
declare i64 @"lazy_add_branch"(i64, i64)
declare i64 @"contract_result_satisfied"(i64)
declare i64 @"neural_set_temperature"(i64)
declare i64 @"activation_rate_get"(i64)
declare i64 @"neural_register_gate_weight"(i64, i64, i64)
declare i64 @"ckpt_context_fork"(i64)
declare i64 @"ckpt_context_merge"(i64, i64)
declare i64 @"sqrt_f64"(i64)
declare i64 @"ckpt_save"(i64)
declare i64 @"contract_result_ok"()
declare i64 @"neural_get_temperature"()
declare i64 @"activation_mean_get"(i64)
declare i64 @"neural_prune_by_weight_magnitude"(i64)
declare i64 @"activation_gate_count"()
declare i64 @"ckpt_restore"(i64)
declare i64 @"contract_result_new"(i64, i64)
declare i64 @"contract_result_free"(i64)
declare i64 @"device_get_default"()
declare i64 @"grad_tape_temperature"(i64)
declare i64 @"json_object_has"(i64, i64)
declare i64 @"neural_is_gate_pruned"(i64)
declare i64 @"ln_f64"(i64)
declare i64 @"device_get"(i64)
declare i64 @"ckpt_count"()
declare i64 @"contract_in_range"(i64, i64, i64)
declare i64 @"grad_tape_set_training"(i64, i64)
declare i64 @"activation_epoch_current"()
declare i64 @"neural_get_pruned_gate_count"()
declare i64 @"exp_f64"(i64)
declare i64 @"sin_f64"(i64)
declare i64 @"json_is_number"(i64)
declare i64 @"string_to_lowercase"(i64)
declare i64 @"string_split_whitespace"(i64)
declare i64 @"device_count"()
declare i64 @"ckpt_context_new"()
declare i64 @"ckpt_context_free"(i64)
declare i64 @"ckpt_context_save"(i64)
declare i64 @"ckpt_context_restore"(i64)
declare i64 @"contract_get_panic_mode"()
declare i64 @"contract_set_panic_mode"(i64)
declare i64 @"grad_tape_set_temperature"(i64, i64)
declare i64 @"activation_epoch_advance"(i64)
declare i64 @"neural_get_gate_count"()
declare i64 @"json_is_bool"(i64)
; v0.13.0 Runtime
declare i64 @"print_string"(i64)
declare i64 @"file_delete"(i64)
declare i64 @"cos_f64"(i64)
declare i64 @"pow_f64"(i64, i64)
declare i64 @"neural_set_training_mode"(i64)
declare i64 @"neural_get_training_mode"()
declare i64 @"neural_sigmoid"(i64)
declare i64 @"neural_register_gate"(i64)
declare i64 @"neural_clear_gate_registry"()
declare i64 @"neural_gate_count"()
declare i64 @"grad_tape_new"()
declare i64 @"grad_tape_free"(i64)
declare i64 @"grad_tape_len"(i64)
declare i64 @"grad_tape_record"(i64, i64)
declare i64 @"contract_check_requires"(i64, i64, i64)
declare i64 @"contract_check_ensures"(i64, i64, i64)
declare i64 @"contract_check_invariant"(i64, i64, i64)
declare i64 @"device_available"(i64)
declare i64 @"activation_count_inc"(i64)
declare i64 @"activation_count_get"(i64)
declare i64 @"ckpt_branch_start"()
declare i64 @"ckpt_branch_end"(i64)
declare i64 @"anneal_exponential"(i64, i64)
declare i64 @"anneal_linear"(i64, i64)
declare i64 @"json_null"()
declare i64 @"json_bool"(i64)
declare i64 @"json_number_i64"(i64)
declare i64 @"json_number_f64"(i64)
declare i64 @"json_array"()
declare i64 @"json_object"()
declare i64 @"json_as_bool"(i64)
declare i64 @"HashMap_new"()
declare i64 @"hashmap_is_empty"(i64)
declare i64 @"timer_start"()
declare i64 @"timer_elapsed_us"(i64)
declare i64 @"timer_elapsed_ms"(i64)
declare i64 @"timer_elapsed_s"(i64)
declare i64 @"timer_close"(i64)
declare i64 @"timer_record_to"(i64, i64)
declare i64 @"logger_new"()
declare i64 @"logger_global"()
declare i64 @"logger_set_level"(i64, i64)
declare i64 @"logger_set_console"(i64, i64)
declare i64 @"logger_set_file"(i64, i64)
declare i64 @"logger_set_json"(i64, i64)
declare i64 @"logger_add_context"(i64, i64, i64)
declare i64 @"logger_close"(i64)
declare i64 @"log_debug"(i64)
declare i64 @"log_info"(i64)
declare i64 @"log_warn"(i64)
declare i64 @"log_error"(i64)
declare i64 @"log_fatal"(i64)
declare i64 @"log_with_field"(i64, i64, i64)
declare i64 @"log_with_span"(i64, i64)
declare i64 @"counter_new"(i64)
declare i64 @"counter_inc"(i64)
declare i64 @"counter_add"(i64, i64)
declare i64 @"counter_add_label"(i64, i64, i64)
declare i64 @"counter_value"(i64)
declare i64 @"gauge_new"(i64)
declare i64 @"gauge_set"(i64, i64)
declare i64 @"gauge_inc"(i64)
declare i64 @"gauge_dec"(i64)
declare i64 @"gauge_add"(i64, i64)
declare i64 @"gauge_value"(i64)
declare i64 @"histogram_new"(i64)
declare i64 @"histogram_observe"(i64, i64)
declare i64 @"histogram_count"(i64)
declare i64 @"histogram_sum"(i64)
declare i64 @"histogram_mean"(i64)
declare i64 @"histogram_min"(i64)
declare i64 @"histogram_max"(i64)
declare i64 @"histogram_to_json"(i64)
declare i64 @"metrics_registry_new"()
declare i64 @"metrics_registry_global"()
declare i64 @"metrics_registry_count"(i64)
declare i64 @"metrics_registry_close"(i64)
declare i64 @"metrics_export_json"(i64)
declare i64 @"metrics_export_prometheus"(i64)
declare i64 @"span_start"(i64)
declare i64 @"span_start_child"(i64, i64)
declare i64 @"span_end"(i64)
declare i64 @"span_close"(i64)
declare i64 @"span_id"(i64)
declare i64 @"span_trace_id"(i64)
declare i64 @"span_duration_us"(i64)
declare i64 @"span_set_attribute"(i64, i64, i64)
declare i64 @"span_set_status"(i64, i64)
declare i64 @"span_add_event"(i64, i64)
declare i64 @"span_to_json"(i64)
declare i64 @"tracer_new"()
declare i64 @"tracer_active_spans"(i64)
declare i64 @"tracer_close"(i64)

define i64 @"abs_f64"(i64 %x) nounwind {
entry:
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t0 = load i64, ptr %local.x
  %t1 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.0)
  %t2 = call i64 @"sx_f64_ge"(i64 %t0, i64 %t1)
  %t3 = icmp ne i64 %t2, 0
  br i1 %t3, label %then0, label %else0
then0:
  %t4 = load i64, ptr %local.x
  br label %then0_end
then0_end:
  br label %endif0
else0:
  %t5 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.1)
  %t6 = load i64, ptr %local.x
  %t7 = call i64 @"sx_f64_sub"(i64 %t5, i64 %t6)
  br label %else0_end
else0_end:
  br label %endif0
endif0:
  %t8 = phi i64 [ %t4, %then0_end ], [ %t7, %else0_end ]
  ret i64 %t8
}

define i64 @"my_sqrt"(i64 %x) nounwind {
entry:
  %local.g.9 = alloca i64
  %local.i.10 = alloca i64
  %local.x = alloca i64
  store i64 %x, ptr %local.x
  %t11 = load i64, ptr %local.x
  %t12 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.2)
  %t13 = call i64 @"sx_f64_le"(i64 %t11, i64 %t12)
  %t14 = icmp ne i64 %t13, 0
  br i1 %t14, label %then1, label %else1
then1:
  %t15 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.3)
  ret i64 %t15
else1:
  br label %else1_end
else1_end:
  br label %endif1
endif1:
  %t16 = phi i64 [ 0, %else1_end ]
  %t17 = load i64, ptr %local.x
  store i64 %t17, ptr %local.g.9
  store i64 0, ptr %local.i.10
  br label %loop2
loop2:
  %t18 = load i64, ptr %local.i.10
  %t19 = icmp slt i64 %t18, 30
  %t20 = zext i1 %t19 to i64
  %t21 = icmp ne i64 %t20, 0
  br i1 %t21, label %body2, label %endloop2
body2:
  %t22 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.4)
  %t23 = load i64, ptr %local.g.9
  %t24 = load i64, ptr %local.x
  %t25 = load i64, ptr %local.g.9
  %t26 = call i64 @"sx_f64_div"(i64 %t24, i64 %t25)
  %t27 = call i64 @"sx_f64_add"(i64 %t23, i64 %t26)
  %t28 = call i64 @"sx_f64_mul"(i64 %t22, i64 %t27)
  store i64 %t28, ptr %local.g.9
  %t29 = load i64, ptr %local.i.10
  %t30 = add i64 %t29, 1
  store i64 %t30, ptr %local.i.10
  br label %loop2
endloop2:
  %t31 = load i64, ptr %local.g.9
  ret i64 %t31
}

define i64 @"enstrophy"(i64 %ox, i64 %oy, i64 %oz) nounwind {
entry:
  %local.ox = alloca i64
  store i64 %ox, ptr %local.ox
  %local.oy = alloca i64
  store i64 %oy, ptr %local.oy
  %local.oz = alloca i64
  store i64 %oz, ptr %local.oz
  %t32 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.5)
  %t33 = load i64, ptr %local.ox
  %t34 = load i64, ptr %local.ox
  %t35 = call i64 @"sx_f64_mul"(i64 %t33, i64 %t34)
  %t36 = load i64, ptr %local.oy
  %t37 = load i64, ptr %local.oy
  %t38 = call i64 @"sx_f64_mul"(i64 %t36, i64 %t37)
  %t39 = call i64 @"sx_f64_add"(i64 %t35, i64 %t38)
  %t40 = load i64, ptr %local.oz
  %t41 = load i64, ptr %local.oz
  %t42 = call i64 @"sx_f64_mul"(i64 %t40, i64 %t41)
  %t43 = call i64 @"sx_f64_add"(i64 %t39, i64 %t42)
  %t44 = call i64 @"sx_f64_mul"(i64 %t32, i64 %t43)
  ret i64 %t44
}

define i64 @"step6"(i64 %u, i64 %v, i64 %w, i64 %ox, i64 %oy, i64 %oz, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.45 = alloca i64
  %local.fd_u.46 = alloca i64
  %local.fd_v.47 = alloca i64
  %local.fd_w.48 = alloca i64
  %local.fd_ox.49 = alloca i64
  %local.fd_oy.50 = alloca i64
  %local.fd_oz.51 = alloca i64
  %local.fs_u.52 = alloca i64
  %local.fs_v.53 = alloca i64
  %local.fs_w.54 = alloca i64
  %local.fv_ox.55 = alloca i64
  %local.fv_oy.56 = alloca i64
  %local.fv_oz.57 = alloca i64
  %local.fq_ox.58 = alloca i64
  %local.fq_oy.59 = alloca i64
  %local.fq_oz.60 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.ox = alloca i64
  store i64 %ox, ptr %local.ox
  %local.oy = alloca i64
  store i64 %oy, ptr %local.oy
  %local.oz = alloca i64
  store i64 %oz, ptr %local.oz
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t61 = load i64, ptr %local.ox
  %t62 = load i64, ptr %local.ox
  %t63 = call i64 @"sx_f64_mul"(i64 %t61, i64 %t62)
  %t64 = load i64, ptr %local.oy
  %t65 = load i64, ptr %local.oy
  %t66 = call i64 @"sx_f64_mul"(i64 %t64, i64 %t65)
  %t67 = call i64 @"sx_f64_add"(i64 %t63, i64 %t66)
  %t68 = load i64, ptr %local.oz
  %t69 = load i64, ptr %local.oz
  %t70 = call i64 @"sx_f64_mul"(i64 %t68, i64 %t69)
  %t71 = call i64 @"sx_f64_add"(i64 %t67, i64 %t70)
  store i64 %t71, ptr %local.omega_sq.45
  %t72 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.6)
  %t73 = load i64, ptr %local.nu
  %t74 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.7)
  %t75 = call i64 @"sx_f64_mul"(i64 %t73, i64 %t74)
  %t76 = load i64, ptr %local.u
  %t77 = call i64 @"sx_f64_mul"(i64 %t75, i64 %t76)
  %t78 = call i64 @"sx_f64_sub"(i64 %t72, i64 %t77)
  store i64 %t78, ptr %local.fd_u.46
  %t79 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.8)
  %t80 = load i64, ptr %local.nu
  %t81 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.9)
  %t82 = call i64 @"sx_f64_mul"(i64 %t80, i64 %t81)
  %t83 = load i64, ptr %local.v
  %t84 = call i64 @"sx_f64_mul"(i64 %t82, i64 %t83)
  %t85 = call i64 @"sx_f64_sub"(i64 %t79, i64 %t84)
  store i64 %t85, ptr %local.fd_v.47
  %t86 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.10)
  %t87 = load i64, ptr %local.nu
  %t88 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.11)
  %t89 = call i64 @"sx_f64_mul"(i64 %t87, i64 %t88)
  %t90 = load i64, ptr %local.w
  %t91 = call i64 @"sx_f64_mul"(i64 %t89, i64 %t90)
  %t92 = call i64 @"sx_f64_sub"(i64 %t86, i64 %t91)
  store i64 %t92, ptr %local.fd_w.48
  %t93 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.12)
  %t94 = load i64, ptr %local.nu
  %t95 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.13)
  %t96 = call i64 @"sx_f64_mul"(i64 %t94, i64 %t95)
  %t97 = load i64, ptr %local.ox
  %t98 = call i64 @"sx_f64_mul"(i64 %t96, i64 %t97)
  %t99 = call i64 @"sx_f64_sub"(i64 %t93, i64 %t98)
  store i64 %t99, ptr %local.fd_ox.49
  %t100 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.14)
  %t101 = load i64, ptr %local.nu
  %t102 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.15)
  %t103 = call i64 @"sx_f64_mul"(i64 %t101, i64 %t102)
  %t104 = load i64, ptr %local.oy
  %t105 = call i64 @"sx_f64_mul"(i64 %t103, i64 %t104)
  %t106 = call i64 @"sx_f64_sub"(i64 %t100, i64 %t105)
  store i64 %t106, ptr %local.fd_oy.50
  %t107 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.16)
  %t108 = load i64, ptr %local.nu
  %t109 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.17)
  %t110 = call i64 @"sx_f64_mul"(i64 %t108, i64 %t109)
  %t111 = load i64, ptr %local.oz
  %t112 = call i64 @"sx_f64_mul"(i64 %t110, i64 %t111)
  %t113 = call i64 @"sx_f64_sub"(i64 %t107, i64 %t112)
  store i64 %t113, ptr %local.fd_oz.51
  %t114 = load i64, ptr %local.sigma
  %t115 = load i64, ptr %local.oy
  %t116 = load i64, ptr %local.w
  %t117 = call i64 @"sx_f64_mul"(i64 %t115, i64 %t116)
  %t118 = load i64, ptr %local.oz
  %t119 = load i64, ptr %local.v
  %t120 = call i64 @"sx_f64_mul"(i64 %t118, i64 %t119)
  %t121 = call i64 @"sx_f64_sub"(i64 %t117, i64 %t120)
  %t122 = call i64 @"sx_f64_mul"(i64 %t114, i64 %t121)
  store i64 %t122, ptr %local.fs_u.52
  %t123 = load i64, ptr %local.sigma
  %t124 = load i64, ptr %local.oz
  %t125 = load i64, ptr %local.u
  %t126 = call i64 @"sx_f64_mul"(i64 %t124, i64 %t125)
  %t127 = load i64, ptr %local.ox
  %t128 = load i64, ptr %local.w
  %t129 = call i64 @"sx_f64_mul"(i64 %t127, i64 %t128)
  %t130 = call i64 @"sx_f64_sub"(i64 %t126, i64 %t129)
  %t131 = call i64 @"sx_f64_mul"(i64 %t123, i64 %t130)
  store i64 %t131, ptr %local.fs_v.53
  %t132 = load i64, ptr %local.sigma
  %t133 = load i64, ptr %local.ox
  %t134 = load i64, ptr %local.v
  %t135 = call i64 @"sx_f64_mul"(i64 %t133, i64 %t134)
  %t136 = load i64, ptr %local.oy
  %t137 = load i64, ptr %local.u
  %t138 = call i64 @"sx_f64_mul"(i64 %t136, i64 %t137)
  %t139 = call i64 @"sx_f64_sub"(i64 %t135, i64 %t138)
  %t140 = call i64 @"sx_f64_mul"(i64 %t132, i64 %t139)
  store i64 %t140, ptr %local.fs_w.54
  %t141 = load i64, ptr %local.lambda
  %t142 = load i64, ptr %local.oy
  %t143 = load i64, ptr %local.w
  %t144 = call i64 @"sx_f64_mul"(i64 %t142, i64 %t143)
  %t145 = load i64, ptr %local.oz
  %t146 = load i64, ptr %local.u
  %t147 = call i64 @"sx_f64_mul"(i64 %t145, i64 %t146)
  %t148 = call i64 @"sx_f64_add"(i64 %t144, i64 %t147)
  %t149 = call i64 @"sx_f64_mul"(i64 %t141, i64 %t148)
  store i64 %t149, ptr %local.fv_ox.55
  %t150 = load i64, ptr %local.lambda
  %t151 = load i64, ptr %local.oz
  %t152 = load i64, ptr %local.u
  %t153 = call i64 @"sx_f64_mul"(i64 %t151, i64 %t152)
  %t154 = load i64, ptr %local.ox
  %t155 = load i64, ptr %local.w
  %t156 = call i64 @"sx_f64_mul"(i64 %t154, i64 %t155)
  %t157 = call i64 @"sx_f64_add"(i64 %t153, i64 %t156)
  %t158 = call i64 @"sx_f64_mul"(i64 %t150, i64 %t157)
  store i64 %t158, ptr %local.fv_oy.56
  %t159 = load i64, ptr %local.lambda
  %t160 = load i64, ptr %local.ox
  %t161 = load i64, ptr %local.v
  %t162 = call i64 @"sx_f64_mul"(i64 %t160, i64 %t161)
  %t163 = load i64, ptr %local.oy
  %t164 = load i64, ptr %local.u
  %t165 = call i64 @"sx_f64_mul"(i64 %t163, i64 %t164)
  %t166 = call i64 @"sx_f64_add"(i64 %t162, i64 %t165)
  %t167 = call i64 @"sx_f64_mul"(i64 %t159, i64 %t166)
  store i64 %t167, ptr %local.fv_oz.57
  %t168 = load i64, ptr %local.lambda2
  %t169 = load i64, ptr %local.omega_sq.45
  %t170 = call i64 @"sx_f64_mul"(i64 %t168, i64 %t169)
  %t171 = load i64, ptr %local.ox
  %t172 = call i64 @"sx_f64_mul"(i64 %t170, i64 %t171)
  store i64 %t172, ptr %local.fq_ox.58
  %t173 = load i64, ptr %local.lambda2
  %t174 = load i64, ptr %local.omega_sq.45
  %t175 = call i64 @"sx_f64_mul"(i64 %t173, i64 %t174)
  %t176 = load i64, ptr %local.oy
  %t177 = call i64 @"sx_f64_mul"(i64 %t175, i64 %t176)
  store i64 %t177, ptr %local.fq_oy.59
  %t178 = load i64, ptr %local.lambda2
  %t179 = load i64, ptr %local.omega_sq.45
  %t180 = call i64 @"sx_f64_mul"(i64 %t178, i64 %t179)
  %t181 = load i64, ptr %local.oz
  %t182 = call i64 @"sx_f64_mul"(i64 %t180, i64 %t181)
  store i64 %t182, ptr %local.fq_oz.60
  %t183 = load i64, ptr %local.which
  %t184 = icmp eq i64 %t183, 0
  %t185 = zext i1 %t184 to i64
  %t186 = icmp ne i64 %t185, 0
  br i1 %t186, label %then3, label %else3
then3:
  %t187 = load i64, ptr %local.u
  %t188 = load i64, ptr %local.dt
  %t189 = load i64, ptr %local.fd_u.46
  %t190 = load i64, ptr %local.fs_u.52
  %t191 = call i64 @"sx_f64_add"(i64 %t189, i64 %t190)
  %t192 = call i64 @"sx_f64_mul"(i64 %t188, i64 %t191)
  %t193 = call i64 @"sx_f64_add"(i64 %t187, i64 %t192)
  ret i64 %t193
else3:
  br label %else3_end
else3_end:
  br label %endif3
endif3:
  %t194 = phi i64 [ 0, %else3_end ]
  %t195 = load i64, ptr %local.which
  %t196 = icmp eq i64 %t195, 1
  %t197 = zext i1 %t196 to i64
  %t198 = icmp ne i64 %t197, 0
  br i1 %t198, label %then4, label %else4
then4:
  %t199 = load i64, ptr %local.v
  %t200 = load i64, ptr %local.dt
  %t201 = load i64, ptr %local.fd_v.47
  %t202 = load i64, ptr %local.fs_v.53
  %t203 = call i64 @"sx_f64_add"(i64 %t201, i64 %t202)
  %t204 = call i64 @"sx_f64_mul"(i64 %t200, i64 %t203)
  %t205 = call i64 @"sx_f64_add"(i64 %t199, i64 %t204)
  ret i64 %t205
else4:
  br label %else4_end
else4_end:
  br label %endif4
endif4:
  %t206 = phi i64 [ 0, %else4_end ]
  %t207 = load i64, ptr %local.which
  %t208 = icmp eq i64 %t207, 2
  %t209 = zext i1 %t208 to i64
  %t210 = icmp ne i64 %t209, 0
  br i1 %t210, label %then5, label %else5
then5:
  %t211 = load i64, ptr %local.w
  %t212 = load i64, ptr %local.dt
  %t213 = load i64, ptr %local.fd_w.48
  %t214 = load i64, ptr %local.fs_w.54
  %t215 = call i64 @"sx_f64_add"(i64 %t213, i64 %t214)
  %t216 = call i64 @"sx_f64_mul"(i64 %t212, i64 %t215)
  %t217 = call i64 @"sx_f64_add"(i64 %t211, i64 %t216)
  ret i64 %t217
else5:
  br label %else5_end
else5_end:
  br label %endif5
endif5:
  %t218 = phi i64 [ 0, %else5_end ]
  %t219 = load i64, ptr %local.which
  %t220 = icmp eq i64 %t219, 3
  %t221 = zext i1 %t220 to i64
  %t222 = icmp ne i64 %t221, 0
  br i1 %t222, label %then6, label %else6
then6:
  %t223 = load i64, ptr %local.ox
  %t224 = load i64, ptr %local.dt
  %t225 = load i64, ptr %local.fd_ox.49
  %t226 = load i64, ptr %local.fv_ox.55
  %t227 = call i64 @"sx_f64_add"(i64 %t225, i64 %t226)
  %t228 = load i64, ptr %local.fq_ox.58
  %t229 = call i64 @"sx_f64_add"(i64 %t227, i64 %t228)
  %t230 = call i64 @"sx_f64_mul"(i64 %t224, i64 %t229)
  %t231 = call i64 @"sx_f64_add"(i64 %t223, i64 %t230)
  ret i64 %t231
else6:
  br label %else6_end
else6_end:
  br label %endif6
endif6:
  %t232 = phi i64 [ 0, %else6_end ]
  %t233 = load i64, ptr %local.which
  %t234 = icmp eq i64 %t233, 4
  %t235 = zext i1 %t234 to i64
  %t236 = icmp ne i64 %t235, 0
  br i1 %t236, label %then7, label %else7
then7:
  %t237 = load i64, ptr %local.oy
  %t238 = load i64, ptr %local.dt
  %t239 = load i64, ptr %local.fd_oy.50
  %t240 = load i64, ptr %local.fv_oy.56
  %t241 = call i64 @"sx_f64_add"(i64 %t239, i64 %t240)
  %t242 = load i64, ptr %local.fq_oy.59
  %t243 = call i64 @"sx_f64_add"(i64 %t241, i64 %t242)
  %t244 = call i64 @"sx_f64_mul"(i64 %t238, i64 %t243)
  %t245 = call i64 @"sx_f64_add"(i64 %t237, i64 %t244)
  ret i64 %t245
else7:
  br label %else7_end
else7_end:
  br label %endif7
endif7:
  %t246 = phi i64 [ 0, %else7_end ]
  %t247 = load i64, ptr %local.oz
  %t248 = load i64, ptr %local.dt
  %t249 = load i64, ptr %local.fd_oz.51
  %t250 = load i64, ptr %local.fv_oz.57
  %t251 = call i64 @"sx_f64_add"(i64 %t249, i64 %t250)
  %t252 = load i64, ptr %local.fq_oz.60
  %t253 = call i64 @"sx_f64_add"(i64 %t251, i64 %t252)
  %t254 = call i64 @"sx_f64_mul"(i64 %t248, i64 %t253)
  %t255 = call i64 @"sx_f64_add"(i64 %t247, i64 %t254)
  ret i64 %t255
}

define i64 @"step8"(i64 %u, i64 %v, i64 %w, i64 %ox, i64 %oy, i64 %oz, i64 %ox2, i64 %oy2, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %which) nounwind {
entry:
  %local.omega_sq.256 = alloca i64
  %local.fd_u.257 = alloca i64
  %local.fd_v.258 = alloca i64
  %local.fd_w.259 = alloca i64
  %local.fd_ox.260 = alloca i64
  %local.fd_oy.261 = alloca i64
  %local.fd_oz.262 = alloca i64
  %local.fd_ox2.263 = alloca i64
  %local.fd_oy2.264 = alloca i64
  %local.fs_u.265 = alloca i64
  %local.fs_v.266 = alloca i64
  %local.fs_w.267 = alloca i64
  %local.fv_ox.268 = alloca i64
  %local.fv_oy.269 = alloca i64
  %local.fv_oz.270 = alloca i64
  %local.fv_ox2.271 = alloca i64
  %local.fv_oy2.272 = alloca i64
  %local.fq_ox.273 = alloca i64
  %local.fq_oy.274 = alloca i64
  %local.fq_oz.275 = alloca i64
  %local.fq_ox2.276 = alloca i64
  %local.fq_oy2.277 = alloca i64
  %local.c_ox2.278 = alloca i64
  %local.c_oy2.279 = alloca i64
  %local.u = alloca i64
  store i64 %u, ptr %local.u
  %local.v = alloca i64
  store i64 %v, ptr %local.v
  %local.w = alloca i64
  store i64 %w, ptr %local.w
  %local.ox = alloca i64
  store i64 %ox, ptr %local.ox
  %local.oy = alloca i64
  store i64 %oy, ptr %local.oy
  %local.oz = alloca i64
  store i64 %oz, ptr %local.oz
  %local.ox2 = alloca i64
  store i64 %ox2, ptr %local.ox2
  %local.oy2 = alloca i64
  store i64 %oy2, ptr %local.oy2
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t280 = load i64, ptr %local.ox
  %t281 = load i64, ptr %local.ox
  %t282 = call i64 @"sx_f64_mul"(i64 %t280, i64 %t281)
  %t283 = load i64, ptr %local.oy
  %t284 = load i64, ptr %local.oy
  %t285 = call i64 @"sx_f64_mul"(i64 %t283, i64 %t284)
  %t286 = call i64 @"sx_f64_add"(i64 %t282, i64 %t285)
  %t287 = load i64, ptr %local.oz
  %t288 = load i64, ptr %local.oz
  %t289 = call i64 @"sx_f64_mul"(i64 %t287, i64 %t288)
  %t290 = call i64 @"sx_f64_add"(i64 %t286, i64 %t289)
  %t291 = load i64, ptr %local.ox2
  %t292 = load i64, ptr %local.ox2
  %t293 = call i64 @"sx_f64_mul"(i64 %t291, i64 %t292)
  %t294 = call i64 @"sx_f64_add"(i64 %t290, i64 %t293)
  %t295 = load i64, ptr %local.oy2
  %t296 = load i64, ptr %local.oy2
  %t297 = call i64 @"sx_f64_mul"(i64 %t295, i64 %t296)
  %t298 = call i64 @"sx_f64_add"(i64 %t294, i64 %t297)
  store i64 %t298, ptr %local.omega_sq.256
  %t299 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.18)
  %t300 = load i64, ptr %local.nu
  %t301 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.19)
  %t302 = call i64 @"sx_f64_mul"(i64 %t300, i64 %t301)
  %t303 = load i64, ptr %local.u
  %t304 = call i64 @"sx_f64_mul"(i64 %t302, i64 %t303)
  %t305 = call i64 @"sx_f64_sub"(i64 %t299, i64 %t304)
  store i64 %t305, ptr %local.fd_u.257
  %t306 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.20)
  %t307 = load i64, ptr %local.nu
  %t308 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.21)
  %t309 = call i64 @"sx_f64_mul"(i64 %t307, i64 %t308)
  %t310 = load i64, ptr %local.v
  %t311 = call i64 @"sx_f64_mul"(i64 %t309, i64 %t310)
  %t312 = call i64 @"sx_f64_sub"(i64 %t306, i64 %t311)
  store i64 %t312, ptr %local.fd_v.258
  %t313 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.22)
  %t314 = load i64, ptr %local.nu
  %t315 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.23)
  %t316 = call i64 @"sx_f64_mul"(i64 %t314, i64 %t315)
  %t317 = load i64, ptr %local.w
  %t318 = call i64 @"sx_f64_mul"(i64 %t316, i64 %t317)
  %t319 = call i64 @"sx_f64_sub"(i64 %t313, i64 %t318)
  store i64 %t319, ptr %local.fd_w.259
  %t320 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.24)
  %t321 = load i64, ptr %local.nu
  %t322 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.25)
  %t323 = call i64 @"sx_f64_mul"(i64 %t321, i64 %t322)
  %t324 = load i64, ptr %local.ox
  %t325 = call i64 @"sx_f64_mul"(i64 %t323, i64 %t324)
  %t326 = call i64 @"sx_f64_sub"(i64 %t320, i64 %t325)
  store i64 %t326, ptr %local.fd_ox.260
  %t327 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.26)
  %t328 = load i64, ptr %local.nu
  %t329 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.27)
  %t330 = call i64 @"sx_f64_mul"(i64 %t328, i64 %t329)
  %t331 = load i64, ptr %local.oy
  %t332 = call i64 @"sx_f64_mul"(i64 %t330, i64 %t331)
  %t333 = call i64 @"sx_f64_sub"(i64 %t327, i64 %t332)
  store i64 %t333, ptr %local.fd_oy.261
  %t334 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.28)
  %t335 = load i64, ptr %local.nu
  %t336 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.29)
  %t337 = call i64 @"sx_f64_mul"(i64 %t335, i64 %t336)
  %t338 = load i64, ptr %local.oz
  %t339 = call i64 @"sx_f64_mul"(i64 %t337, i64 %t338)
  %t340 = call i64 @"sx_f64_sub"(i64 %t334, i64 %t339)
  store i64 %t340, ptr %local.fd_oz.262
  %t341 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.30)
  %t342 = load i64, ptr %local.nu
  %t343 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.31)
  %t344 = call i64 @"sx_f64_mul"(i64 %t342, i64 %t343)
  %t345 = load i64, ptr %local.ox2
  %t346 = call i64 @"sx_f64_mul"(i64 %t344, i64 %t345)
  %t347 = call i64 @"sx_f64_sub"(i64 %t341, i64 %t346)
  store i64 %t347, ptr %local.fd_ox2.263
  %t348 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.32)
  %t349 = load i64, ptr %local.nu
  %t350 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.33)
  %t351 = call i64 @"sx_f64_mul"(i64 %t349, i64 %t350)
  %t352 = load i64, ptr %local.oy2
  %t353 = call i64 @"sx_f64_mul"(i64 %t351, i64 %t352)
  %t354 = call i64 @"sx_f64_sub"(i64 %t348, i64 %t353)
  store i64 %t354, ptr %local.fd_oy2.264
  %t355 = load i64, ptr %local.sigma
  %t356 = load i64, ptr %local.oy
  %t357 = load i64, ptr %local.w
  %t358 = call i64 @"sx_f64_mul"(i64 %t356, i64 %t357)
  %t359 = load i64, ptr %local.oz
  %t360 = load i64, ptr %local.v
  %t361 = call i64 @"sx_f64_mul"(i64 %t359, i64 %t360)
  %t362 = call i64 @"sx_f64_sub"(i64 %t358, i64 %t361)
  %t363 = call i64 @"sx_f64_mul"(i64 %t355, i64 %t362)
  store i64 %t363, ptr %local.fs_u.265
  %t364 = load i64, ptr %local.sigma
  %t365 = load i64, ptr %local.oz
  %t366 = load i64, ptr %local.u
  %t367 = call i64 @"sx_f64_mul"(i64 %t365, i64 %t366)
  %t368 = load i64, ptr %local.ox
  %t369 = load i64, ptr %local.w
  %t370 = call i64 @"sx_f64_mul"(i64 %t368, i64 %t369)
  %t371 = call i64 @"sx_f64_sub"(i64 %t367, i64 %t370)
  %t372 = call i64 @"sx_f64_mul"(i64 %t364, i64 %t371)
  store i64 %t372, ptr %local.fs_v.266
  %t373 = load i64, ptr %local.sigma
  %t374 = load i64, ptr %local.ox
  %t375 = load i64, ptr %local.v
  %t376 = call i64 @"sx_f64_mul"(i64 %t374, i64 %t375)
  %t377 = load i64, ptr %local.oy
  %t378 = load i64, ptr %local.u
  %t379 = call i64 @"sx_f64_mul"(i64 %t377, i64 %t378)
  %t380 = call i64 @"sx_f64_sub"(i64 %t376, i64 %t379)
  %t381 = call i64 @"sx_f64_mul"(i64 %t373, i64 %t380)
  store i64 %t381, ptr %local.fs_w.267
  %t382 = load i64, ptr %local.lambda
  %t383 = load i64, ptr %local.oy
  %t384 = load i64, ptr %local.w
  %t385 = call i64 @"sx_f64_mul"(i64 %t383, i64 %t384)
  %t386 = load i64, ptr %local.oz
  %t387 = load i64, ptr %local.u
  %t388 = call i64 @"sx_f64_mul"(i64 %t386, i64 %t387)
  %t389 = call i64 @"sx_f64_add"(i64 %t385, i64 %t388)
  %t390 = call i64 @"sx_f64_mul"(i64 %t382, i64 %t389)
  store i64 %t390, ptr %local.fv_ox.268
  %t391 = load i64, ptr %local.lambda
  %t392 = load i64, ptr %local.oz
  %t393 = load i64, ptr %local.u
  %t394 = call i64 @"sx_f64_mul"(i64 %t392, i64 %t393)
  %t395 = load i64, ptr %local.ox
  %t396 = load i64, ptr %local.w
  %t397 = call i64 @"sx_f64_mul"(i64 %t395, i64 %t396)
  %t398 = call i64 @"sx_f64_add"(i64 %t394, i64 %t397)
  %t399 = call i64 @"sx_f64_mul"(i64 %t391, i64 %t398)
  store i64 %t399, ptr %local.fv_oy.269
  %t400 = load i64, ptr %local.lambda
  %t401 = load i64, ptr %local.ox
  %t402 = load i64, ptr %local.v
  %t403 = call i64 @"sx_f64_mul"(i64 %t401, i64 %t402)
  %t404 = load i64, ptr %local.oy
  %t405 = load i64, ptr %local.u
  %t406 = call i64 @"sx_f64_mul"(i64 %t404, i64 %t405)
  %t407 = call i64 @"sx_f64_add"(i64 %t403, i64 %t406)
  %t408 = call i64 @"sx_f64_mul"(i64 %t400, i64 %t407)
  store i64 %t408, ptr %local.fv_oz.270
  %t409 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.34)
  %t410 = load i64, ptr %local.lambda
  %t411 = call i64 @"sx_f64_mul"(i64 %t409, i64 %t410)
  %t412 = load i64, ptr %local.oy
  %t413 = load i64, ptr %local.w
  %t414 = call i64 @"sx_f64_mul"(i64 %t412, i64 %t413)
  %t415 = load i64, ptr %local.oz
  %t416 = load i64, ptr %local.u
  %t417 = call i64 @"sx_f64_mul"(i64 %t415, i64 %t416)
  %t418 = call i64 @"sx_f64_add"(i64 %t414, i64 %t417)
  %t419 = call i64 @"sx_f64_mul"(i64 %t411, i64 %t418)
  store i64 %t419, ptr %local.fv_ox2.271
  %t420 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.35)
  %t421 = load i64, ptr %local.lambda
  %t422 = call i64 @"sx_f64_mul"(i64 %t420, i64 %t421)
  %t423 = load i64, ptr %local.oz
  %t424 = load i64, ptr %local.u
  %t425 = call i64 @"sx_f64_mul"(i64 %t423, i64 %t424)
  %t426 = load i64, ptr %local.ox
  %t427 = load i64, ptr %local.w
  %t428 = call i64 @"sx_f64_mul"(i64 %t426, i64 %t427)
  %t429 = call i64 @"sx_f64_add"(i64 %t425, i64 %t428)
  %t430 = call i64 @"sx_f64_mul"(i64 %t422, i64 %t429)
  store i64 %t430, ptr %local.fv_oy2.272
  %t431 = load i64, ptr %local.lambda2
  %t432 = load i64, ptr %local.omega_sq.256
  %t433 = call i64 @"sx_f64_mul"(i64 %t431, i64 %t432)
  %t434 = load i64, ptr %local.ox
  %t435 = call i64 @"sx_f64_mul"(i64 %t433, i64 %t434)
  store i64 %t435, ptr %local.fq_ox.273
  %t436 = load i64, ptr %local.lambda2
  %t437 = load i64, ptr %local.omega_sq.256
  %t438 = call i64 @"sx_f64_mul"(i64 %t436, i64 %t437)
  %t439 = load i64, ptr %local.oy
  %t440 = call i64 @"sx_f64_mul"(i64 %t438, i64 %t439)
  store i64 %t440, ptr %local.fq_oy.274
  %t441 = load i64, ptr %local.lambda2
  %t442 = load i64, ptr %local.omega_sq.256
  %t443 = call i64 @"sx_f64_mul"(i64 %t441, i64 %t442)
  %t444 = load i64, ptr %local.oz
  %t445 = call i64 @"sx_f64_mul"(i64 %t443, i64 %t444)
  store i64 %t445, ptr %local.fq_oz.275
  %t446 = load i64, ptr %local.lambda2
  %t447 = load i64, ptr %local.omega_sq.256
  %t448 = call i64 @"sx_f64_mul"(i64 %t446, i64 %t447)
  %t449 = load i64, ptr %local.ox2
  %t450 = call i64 @"sx_f64_mul"(i64 %t448, i64 %t449)
  store i64 %t450, ptr %local.fq_ox2.276
  %t451 = load i64, ptr %local.lambda2
  %t452 = load i64, ptr %local.omega_sq.256
  %t453 = call i64 @"sx_f64_mul"(i64 %t451, i64 %t452)
  %t454 = load i64, ptr %local.oy2
  %t455 = call i64 @"sx_f64_mul"(i64 %t453, i64 %t454)
  store i64 %t455, ptr %local.fq_oy2.277
  %t456 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.36)
  %t457 = load i64, ptr %local.ox
  %t458 = call i64 @"sx_f64_mul"(i64 %t456, i64 %t457)
  %t459 = load i64, ptr %local.oy
  %t460 = call i64 @"sx_f64_mul"(i64 %t458, i64 %t459)
  store i64 %t460, ptr %local.c_ox2.278
  %t461 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.37)
  %t462 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.38)
  %t463 = load i64, ptr %local.ox
  %t464 = load i64, ptr %local.oy
  %t465 = call i64 @"sx_f64_mul"(i64 %t463, i64 %t464)
  %t466 = call i64 @"sx_f64_sub"(i64 %t462, i64 %t465)
  %t467 = call i64 @"sx_f64_mul"(i64 %t461, i64 %t466)
  store i64 %t467, ptr %local.c_oy2.279
  %t468 = load i64, ptr %local.which
  %t469 = icmp eq i64 %t468, 0
  %t470 = zext i1 %t469 to i64
  %t471 = icmp ne i64 %t470, 0
  br i1 %t471, label %then8, label %else8
then8:
  %t472 = load i64, ptr %local.u
  %t473 = load i64, ptr %local.dt
  %t474 = load i64, ptr %local.fd_u.257
  %t475 = load i64, ptr %local.fs_u.265
  %t476 = call i64 @"sx_f64_add"(i64 %t474, i64 %t475)
  %t477 = call i64 @"sx_f64_mul"(i64 %t473, i64 %t476)
  %t478 = call i64 @"sx_f64_add"(i64 %t472, i64 %t477)
  ret i64 %t478
else8:
  br label %else8_end
else8_end:
  br label %endif8
endif8:
  %t479 = phi i64 [ 0, %else8_end ]
  %t480 = load i64, ptr %local.which
  %t481 = icmp eq i64 %t480, 1
  %t482 = zext i1 %t481 to i64
  %t483 = icmp ne i64 %t482, 0
  br i1 %t483, label %then9, label %else9
then9:
  %t484 = load i64, ptr %local.v
  %t485 = load i64, ptr %local.dt
  %t486 = load i64, ptr %local.fd_v.258
  %t487 = load i64, ptr %local.fs_v.266
  %t488 = call i64 @"sx_f64_add"(i64 %t486, i64 %t487)
  %t489 = call i64 @"sx_f64_mul"(i64 %t485, i64 %t488)
  %t490 = call i64 @"sx_f64_add"(i64 %t484, i64 %t489)
  ret i64 %t490
else9:
  br label %else9_end
else9_end:
  br label %endif9
endif9:
  %t491 = phi i64 [ 0, %else9_end ]
  %t492 = load i64, ptr %local.which
  %t493 = icmp eq i64 %t492, 2
  %t494 = zext i1 %t493 to i64
  %t495 = icmp ne i64 %t494, 0
  br i1 %t495, label %then10, label %else10
then10:
  %t496 = load i64, ptr %local.w
  %t497 = load i64, ptr %local.dt
  %t498 = load i64, ptr %local.fd_w.259
  %t499 = load i64, ptr %local.fs_w.267
  %t500 = call i64 @"sx_f64_add"(i64 %t498, i64 %t499)
  %t501 = call i64 @"sx_f64_mul"(i64 %t497, i64 %t500)
  %t502 = call i64 @"sx_f64_add"(i64 %t496, i64 %t501)
  ret i64 %t502
else10:
  br label %else10_end
else10_end:
  br label %endif10
endif10:
  %t503 = phi i64 [ 0, %else10_end ]
  %t504 = load i64, ptr %local.which
  %t505 = icmp eq i64 %t504, 3
  %t506 = zext i1 %t505 to i64
  %t507 = icmp ne i64 %t506, 0
  br i1 %t507, label %then11, label %else11
then11:
  %t508 = load i64, ptr %local.ox
  %t509 = load i64, ptr %local.dt
  %t510 = load i64, ptr %local.fd_ox.260
  %t511 = load i64, ptr %local.fv_ox.268
  %t512 = call i64 @"sx_f64_add"(i64 %t510, i64 %t511)
  %t513 = load i64, ptr %local.fq_ox.273
  %t514 = call i64 @"sx_f64_add"(i64 %t512, i64 %t513)
  %t515 = call i64 @"sx_f64_mul"(i64 %t509, i64 %t514)
  %t516 = call i64 @"sx_f64_add"(i64 %t508, i64 %t515)
  ret i64 %t516
else11:
  br label %else11_end
else11_end:
  br label %endif11
endif11:
  %t517 = phi i64 [ 0, %else11_end ]
  %t518 = load i64, ptr %local.which
  %t519 = icmp eq i64 %t518, 4
  %t520 = zext i1 %t519 to i64
  %t521 = icmp ne i64 %t520, 0
  br i1 %t521, label %then12, label %else12
then12:
  %t522 = load i64, ptr %local.oy
  %t523 = load i64, ptr %local.dt
  %t524 = load i64, ptr %local.fd_oy.261
  %t525 = load i64, ptr %local.fv_oy.269
  %t526 = call i64 @"sx_f64_add"(i64 %t524, i64 %t525)
  %t527 = load i64, ptr %local.fq_oy.274
  %t528 = call i64 @"sx_f64_add"(i64 %t526, i64 %t527)
  %t529 = call i64 @"sx_f64_mul"(i64 %t523, i64 %t528)
  %t530 = call i64 @"sx_f64_add"(i64 %t522, i64 %t529)
  ret i64 %t530
else12:
  br label %else12_end
else12_end:
  br label %endif12
endif12:
  %t531 = phi i64 [ 0, %else12_end ]
  %t532 = load i64, ptr %local.which
  %t533 = icmp eq i64 %t532, 5
  %t534 = zext i1 %t533 to i64
  %t535 = icmp ne i64 %t534, 0
  br i1 %t535, label %then13, label %else13
then13:
  %t536 = load i64, ptr %local.oz
  %t537 = load i64, ptr %local.dt
  %t538 = load i64, ptr %local.fd_oz.262
  %t539 = load i64, ptr %local.fv_oz.270
  %t540 = call i64 @"sx_f64_add"(i64 %t538, i64 %t539)
  %t541 = load i64, ptr %local.fq_oz.275
  %t542 = call i64 @"sx_f64_add"(i64 %t540, i64 %t541)
  %t543 = call i64 @"sx_f64_mul"(i64 %t537, i64 %t542)
  %t544 = call i64 @"sx_f64_add"(i64 %t536, i64 %t543)
  ret i64 %t544
else13:
  br label %else13_end
else13_end:
  br label %endif13
endif13:
  %t545 = phi i64 [ 0, %else13_end ]
  %t546 = load i64, ptr %local.which
  %t547 = icmp eq i64 %t546, 6
  %t548 = zext i1 %t547 to i64
  %t549 = icmp ne i64 %t548, 0
  br i1 %t549, label %then14, label %else14
then14:
  %t550 = load i64, ptr %local.ox2
  %t551 = load i64, ptr %local.dt
  %t552 = load i64, ptr %local.fd_ox2.263
  %t553 = load i64, ptr %local.fv_ox2.271
  %t554 = call i64 @"sx_f64_add"(i64 %t552, i64 %t553)
  %t555 = load i64, ptr %local.fq_ox2.276
  %t556 = call i64 @"sx_f64_add"(i64 %t554, i64 %t555)
  %t557 = load i64, ptr %local.c_ox2.278
  %t558 = call i64 @"sx_f64_add"(i64 %t556, i64 %t557)
  %t559 = call i64 @"sx_f64_mul"(i64 %t551, i64 %t558)
  %t560 = call i64 @"sx_f64_add"(i64 %t550, i64 %t559)
  ret i64 %t560
else14:
  br label %else14_end
else14_end:
  br label %endif14
endif14:
  %t561 = phi i64 [ 0, %else14_end ]
  %t562 = load i64, ptr %local.oy2
  %t563 = load i64, ptr %local.dt
  %t564 = load i64, ptr %local.fd_oy2.264
  %t565 = load i64, ptr %local.fv_oy2.272
  %t566 = call i64 @"sx_f64_add"(i64 %t564, i64 %t565)
  %t567 = load i64, ptr %local.fq_oy2.277
  %t568 = call i64 @"sx_f64_add"(i64 %t566, i64 %t567)
  %t569 = load i64, ptr %local.c_oy2.279
  %t570 = call i64 @"sx_f64_add"(i64 %t568, i64 %t569)
  %t571 = call i64 @"sx_f64_mul"(i64 %t563, i64 %t570)
  %t572 = call i64 @"sx_f64_add"(i64 %t562, i64 %t571)
  ret i64 %t572
}

define i64 @"run6_final"(i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %steps, i64 %which) nounwind {
entry:
  %local.pi.573 = alloca i64
  %local.u.574 = alloca i64
  %local.v.575 = alloca i64
  %local.w.576 = alloca i64
  %local.ox.577 = alloca i64
  %local.oy.578 = alloca i64
  %local.oz.579 = alloca i64
  %local.s.580 = alloca i64
  %local.n0.581 = alloca i64
  %local.n1.582 = alloca i64
  %local.n2.583 = alloca i64
  %local.n3.584 = alloca i64
  %local.n4.585 = alloca i64
  %local.n5.586 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t587 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.39)
  store i64 %t587, ptr %local.pi.573
  %t588 = load i64, ptr %local.amp
  %t589 = load i64, ptr %local.pi.573
  %t590 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.40)
  %t591 = call i64 @"sx_f64_mul"(i64 %t589, i64 %t590)
  %t592 = call i64 @"sin_f64"(i64 %t591)
  %t593 = call i64 @"sx_f64_mul"(i64 %t588, i64 %t592)
  store i64 %t593, ptr %local.u.574
  %t594 = load i64, ptr %local.amp
  %t595 = load i64, ptr %local.pi.573
  %t596 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.41)
  %t597 = call i64 @"sx_f64_mul"(i64 %t595, i64 %t596)
  %t598 = call i64 @"sin_f64"(i64 %t597)
  %t599 = call i64 @"sx_f64_mul"(i64 %t594, i64 %t598)
  store i64 %t599, ptr %local.v.575
  %t600 = load i64, ptr %local.amp
  %t601 = load i64, ptr %local.pi.573
  %t602 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.42)
  %t603 = call i64 @"sx_f64_mul"(i64 %t601, i64 %t602)
  %t604 = call i64 @"sin_f64"(i64 %t603)
  %t605 = call i64 @"sx_f64_mul"(i64 %t600, i64 %t604)
  store i64 %t605, ptr %local.w.576
  %t606 = load i64, ptr %local.amp
  %t607 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.43)
  %t608 = call i64 @"sx_f64_mul"(i64 %t606, i64 %t607)
  %t609 = load i64, ptr %local.pi.573
  %t610 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.44)
  %t611 = call i64 @"sx_f64_mul"(i64 %t609, i64 %t610)
  %t612 = call i64 @"sin_f64"(i64 %t611)
  %t613 = call i64 @"sx_f64_mul"(i64 %t608, i64 %t612)
  store i64 %t613, ptr %local.ox.577
  %t614 = load i64, ptr %local.amp
  %t615 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.45)
  %t616 = call i64 @"sx_f64_mul"(i64 %t614, i64 %t615)
  %t617 = load i64, ptr %local.pi.573
  %t618 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.46)
  %t619 = call i64 @"sx_f64_mul"(i64 %t617, i64 %t618)
  %t620 = call i64 @"sin_f64"(i64 %t619)
  %t621 = call i64 @"sx_f64_mul"(i64 %t616, i64 %t620)
  store i64 %t621, ptr %local.oy.578
  %t622 = load i64, ptr %local.amp
  %t623 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.47)
  %t624 = call i64 @"sx_f64_mul"(i64 %t622, i64 %t623)
  %t625 = load i64, ptr %local.pi.573
  %t626 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.48)
  %t627 = call i64 @"sx_f64_mul"(i64 %t625, i64 %t626)
  %t628 = call i64 @"sin_f64"(i64 %t627)
  %t629 = call i64 @"sx_f64_mul"(i64 %t624, i64 %t628)
  store i64 %t629, ptr %local.oz.579
  store i64 0, ptr %local.s.580
  br label %loop15
loop15:
  %t630 = load i64, ptr %local.s.580
  %t631 = load i64, ptr %local.steps
  %t632 = icmp slt i64 %t630, %t631
  %t633 = zext i1 %t632 to i64
  %t634 = icmp ne i64 %t633, 0
  br i1 %t634, label %body15, label %endloop15
body15:
  %t635 = load i64, ptr %local.u.574
  %t636 = load i64, ptr %local.v.575
  %t637 = load i64, ptr %local.w.576
  %t638 = load i64, ptr %local.ox.577
  %t639 = load i64, ptr %local.oy.578
  %t640 = load i64, ptr %local.oz.579
  %t641 = load i64, ptr %local.nu
  %t642 = load i64, ptr %local.sigma
  %t643 = load i64, ptr %local.lambda
  %t644 = load i64, ptr %local.lambda2
  %t645 = load i64, ptr %local.dt
  %t646 = call i64 @"step6"(i64 %t635, i64 %t636, i64 %t637, i64 %t638, i64 %t639, i64 %t640, i64 %t641, i64 %t642, i64 %t643, i64 %t644, i64 %t645, i64 0)
  store i64 %t646, ptr %local.n0.581
  %t647 = load i64, ptr %local.u.574
  %t648 = load i64, ptr %local.v.575
  %t649 = load i64, ptr %local.w.576
  %t650 = load i64, ptr %local.ox.577
  %t651 = load i64, ptr %local.oy.578
  %t652 = load i64, ptr %local.oz.579
  %t653 = load i64, ptr %local.nu
  %t654 = load i64, ptr %local.sigma
  %t655 = load i64, ptr %local.lambda
  %t656 = load i64, ptr %local.lambda2
  %t657 = load i64, ptr %local.dt
  %t658 = call i64 @"step6"(i64 %t647, i64 %t648, i64 %t649, i64 %t650, i64 %t651, i64 %t652, i64 %t653, i64 %t654, i64 %t655, i64 %t656, i64 %t657, i64 1)
  store i64 %t658, ptr %local.n1.582
  %t659 = load i64, ptr %local.u.574
  %t660 = load i64, ptr %local.v.575
  %t661 = load i64, ptr %local.w.576
  %t662 = load i64, ptr %local.ox.577
  %t663 = load i64, ptr %local.oy.578
  %t664 = load i64, ptr %local.oz.579
  %t665 = load i64, ptr %local.nu
  %t666 = load i64, ptr %local.sigma
  %t667 = load i64, ptr %local.lambda
  %t668 = load i64, ptr %local.lambda2
  %t669 = load i64, ptr %local.dt
  %t670 = call i64 @"step6"(i64 %t659, i64 %t660, i64 %t661, i64 %t662, i64 %t663, i64 %t664, i64 %t665, i64 %t666, i64 %t667, i64 %t668, i64 %t669, i64 2)
  store i64 %t670, ptr %local.n2.583
  %t671 = load i64, ptr %local.u.574
  %t672 = load i64, ptr %local.v.575
  %t673 = load i64, ptr %local.w.576
  %t674 = load i64, ptr %local.ox.577
  %t675 = load i64, ptr %local.oy.578
  %t676 = load i64, ptr %local.oz.579
  %t677 = load i64, ptr %local.nu
  %t678 = load i64, ptr %local.sigma
  %t679 = load i64, ptr %local.lambda
  %t680 = load i64, ptr %local.lambda2
  %t681 = load i64, ptr %local.dt
  %t682 = call i64 @"step6"(i64 %t671, i64 %t672, i64 %t673, i64 %t674, i64 %t675, i64 %t676, i64 %t677, i64 %t678, i64 %t679, i64 %t680, i64 %t681, i64 3)
  store i64 %t682, ptr %local.n3.584
  %t683 = load i64, ptr %local.u.574
  %t684 = load i64, ptr %local.v.575
  %t685 = load i64, ptr %local.w.576
  %t686 = load i64, ptr %local.ox.577
  %t687 = load i64, ptr %local.oy.578
  %t688 = load i64, ptr %local.oz.579
  %t689 = load i64, ptr %local.nu
  %t690 = load i64, ptr %local.sigma
  %t691 = load i64, ptr %local.lambda
  %t692 = load i64, ptr %local.lambda2
  %t693 = load i64, ptr %local.dt
  %t694 = call i64 @"step6"(i64 %t683, i64 %t684, i64 %t685, i64 %t686, i64 %t687, i64 %t688, i64 %t689, i64 %t690, i64 %t691, i64 %t692, i64 %t693, i64 4)
  store i64 %t694, ptr %local.n4.585
  %t695 = load i64, ptr %local.u.574
  %t696 = load i64, ptr %local.v.575
  %t697 = load i64, ptr %local.w.576
  %t698 = load i64, ptr %local.ox.577
  %t699 = load i64, ptr %local.oy.578
  %t700 = load i64, ptr %local.oz.579
  %t701 = load i64, ptr %local.nu
  %t702 = load i64, ptr %local.sigma
  %t703 = load i64, ptr %local.lambda
  %t704 = load i64, ptr %local.lambda2
  %t705 = load i64, ptr %local.dt
  %t706 = call i64 @"step6"(i64 %t695, i64 %t696, i64 %t697, i64 %t698, i64 %t699, i64 %t700, i64 %t701, i64 %t702, i64 %t703, i64 %t704, i64 %t705, i64 5)
  store i64 %t706, ptr %local.n5.586
  %t707 = load i64, ptr %local.n0.581
  store i64 %t707, ptr %local.u.574
  %t708 = load i64, ptr %local.n1.582
  store i64 %t708, ptr %local.v.575
  %t709 = load i64, ptr %local.n2.583
  store i64 %t709, ptr %local.w.576
  %t710 = load i64, ptr %local.n3.584
  store i64 %t710, ptr %local.ox.577
  %t711 = load i64, ptr %local.n4.585
  store i64 %t711, ptr %local.oy.578
  %t712 = load i64, ptr %local.n5.586
  store i64 %t712, ptr %local.oz.579
  %t713 = load i64, ptr %local.s.580
  %t714 = add i64 %t713, 1
  store i64 %t714, ptr %local.s.580
  br label %loop15
endloop15:
  %t715 = load i64, ptr %local.which
  %t716 = icmp eq i64 %t715, 0
  %t717 = zext i1 %t716 to i64
  %t718 = icmp ne i64 %t717, 0
  br i1 %t718, label %then16, label %else16
then16:
  %t719 = load i64, ptr %local.u.574
  ret i64 %t719
else16:
  br label %else16_end
else16_end:
  br label %endif16
endif16:
  %t720 = phi i64 [ 0, %else16_end ]
  %t721 = load i64, ptr %local.which
  %t722 = icmp eq i64 %t721, 1
  %t723 = zext i1 %t722 to i64
  %t724 = icmp ne i64 %t723, 0
  br i1 %t724, label %then17, label %else17
then17:
  %t725 = load i64, ptr %local.v.575
  ret i64 %t725
else17:
  br label %else17_end
else17_end:
  br label %endif17
endif17:
  %t726 = phi i64 [ 0, %else17_end ]
  %t727 = load i64, ptr %local.which
  %t728 = icmp eq i64 %t727, 2
  %t729 = zext i1 %t728 to i64
  %t730 = icmp ne i64 %t729, 0
  br i1 %t730, label %then18, label %else18
then18:
  %t731 = load i64, ptr %local.w.576
  ret i64 %t731
else18:
  br label %else18_end
else18_end:
  br label %endif18
endif18:
  %t732 = phi i64 [ 0, %else18_end ]
  %t733 = load i64, ptr %local.which
  %t734 = icmp eq i64 %t733, 3
  %t735 = zext i1 %t734 to i64
  %t736 = icmp ne i64 %t735, 0
  br i1 %t736, label %then19, label %else19
then19:
  %t737 = load i64, ptr %local.ox.577
  ret i64 %t737
else19:
  br label %else19_end
else19_end:
  br label %endif19
endif19:
  %t738 = phi i64 [ 0, %else19_end ]
  %t739 = load i64, ptr %local.which
  %t740 = icmp eq i64 %t739, 4
  %t741 = zext i1 %t740 to i64
  %t742 = icmp ne i64 %t741, 0
  br i1 %t742, label %then20, label %else20
then20:
  %t743 = load i64, ptr %local.oy.578
  ret i64 %t743
else20:
  br label %else20_end
else20_end:
  br label %endif20
endif20:
  %t744 = phi i64 [ 0, %else20_end ]
  %t745 = load i64, ptr %local.oz.579
  ret i64 %t745
}

define i64 @"run8_final"(i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %steps, i64 %which) nounwind {
entry:
  %local.pi.746 = alloca i64
  %local.u.747 = alloca i64
  %local.v.748 = alloca i64
  %local.w.749 = alloca i64
  %local.ox.750 = alloca i64
  %local.oy.751 = alloca i64
  %local.oz.752 = alloca i64
  %local.ox2.753 = alloca i64
  %local.oy2.754 = alloca i64
  %local.s.755 = alloca i64
  %local.n0.756 = alloca i64
  %local.n1.757 = alloca i64
  %local.n2.758 = alloca i64
  %local.n3.759 = alloca i64
  %local.n4.760 = alloca i64
  %local.n5.761 = alloca i64
  %local.n6.762 = alloca i64
  %local.n7.763 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %local.which = alloca i64
  store i64 %which, ptr %local.which
  %t764 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.49)
  store i64 %t764, ptr %local.pi.746
  %t765 = load i64, ptr %local.amp
  %t766 = load i64, ptr %local.pi.746
  %t767 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.50)
  %t768 = call i64 @"sx_f64_mul"(i64 %t766, i64 %t767)
  %t769 = call i64 @"sin_f64"(i64 %t768)
  %t770 = call i64 @"sx_f64_mul"(i64 %t765, i64 %t769)
  store i64 %t770, ptr %local.u.747
  %t771 = load i64, ptr %local.amp
  %t772 = load i64, ptr %local.pi.746
  %t773 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.51)
  %t774 = call i64 @"sx_f64_mul"(i64 %t772, i64 %t773)
  %t775 = call i64 @"sin_f64"(i64 %t774)
  %t776 = call i64 @"sx_f64_mul"(i64 %t771, i64 %t775)
  store i64 %t776, ptr %local.v.748
  %t777 = load i64, ptr %local.amp
  %t778 = load i64, ptr %local.pi.746
  %t779 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.52)
  %t780 = call i64 @"sx_f64_mul"(i64 %t778, i64 %t779)
  %t781 = call i64 @"sin_f64"(i64 %t780)
  %t782 = call i64 @"sx_f64_mul"(i64 %t777, i64 %t781)
  store i64 %t782, ptr %local.w.749
  %t783 = load i64, ptr %local.amp
  %t784 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.53)
  %t785 = call i64 @"sx_f64_mul"(i64 %t783, i64 %t784)
  %t786 = load i64, ptr %local.pi.746
  %t787 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.54)
  %t788 = call i64 @"sx_f64_mul"(i64 %t786, i64 %t787)
  %t789 = call i64 @"sin_f64"(i64 %t788)
  %t790 = call i64 @"sx_f64_mul"(i64 %t785, i64 %t789)
  store i64 %t790, ptr %local.ox.750
  %t791 = load i64, ptr %local.amp
  %t792 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.55)
  %t793 = call i64 @"sx_f64_mul"(i64 %t791, i64 %t792)
  %t794 = load i64, ptr %local.pi.746
  %t795 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.56)
  %t796 = call i64 @"sx_f64_mul"(i64 %t794, i64 %t795)
  %t797 = call i64 @"sin_f64"(i64 %t796)
  %t798 = call i64 @"sx_f64_mul"(i64 %t793, i64 %t797)
  store i64 %t798, ptr %local.oy.751
  %t799 = load i64, ptr %local.amp
  %t800 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.57)
  %t801 = call i64 @"sx_f64_mul"(i64 %t799, i64 %t800)
  %t802 = load i64, ptr %local.pi.746
  %t803 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.58)
  %t804 = call i64 @"sx_f64_mul"(i64 %t802, i64 %t803)
  %t805 = call i64 @"sin_f64"(i64 %t804)
  %t806 = call i64 @"sx_f64_mul"(i64 %t801, i64 %t805)
  store i64 %t806, ptr %local.oz.752
  %t807 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.59)
  store i64 %t807, ptr %local.ox2.753
  %t808 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.60)
  store i64 %t808, ptr %local.oy2.754
  store i64 0, ptr %local.s.755
  br label %loop21
loop21:
  %t809 = load i64, ptr %local.s.755
  %t810 = load i64, ptr %local.steps
  %t811 = icmp slt i64 %t809, %t810
  %t812 = zext i1 %t811 to i64
  %t813 = icmp ne i64 %t812, 0
  br i1 %t813, label %body21, label %endloop21
body21:
  %t814 = load i64, ptr %local.u.747
  %t815 = load i64, ptr %local.v.748
  %t816 = load i64, ptr %local.w.749
  %t817 = load i64, ptr %local.ox.750
  %t818 = load i64, ptr %local.oy.751
  %t819 = load i64, ptr %local.oz.752
  %t820 = load i64, ptr %local.ox2.753
  %t821 = load i64, ptr %local.oy2.754
  %t822 = load i64, ptr %local.nu
  %t823 = load i64, ptr %local.sigma
  %t824 = load i64, ptr %local.lambda
  %t825 = load i64, ptr %local.lambda2
  %t826 = load i64, ptr %local.dt
  %t827 = call i64 @"step8"(i64 %t814, i64 %t815, i64 %t816, i64 %t817, i64 %t818, i64 %t819, i64 %t820, i64 %t821, i64 %t822, i64 %t823, i64 %t824, i64 %t825, i64 %t826, i64 0)
  store i64 %t827, ptr %local.n0.756
  %t828 = load i64, ptr %local.u.747
  %t829 = load i64, ptr %local.v.748
  %t830 = load i64, ptr %local.w.749
  %t831 = load i64, ptr %local.ox.750
  %t832 = load i64, ptr %local.oy.751
  %t833 = load i64, ptr %local.oz.752
  %t834 = load i64, ptr %local.ox2.753
  %t835 = load i64, ptr %local.oy2.754
  %t836 = load i64, ptr %local.nu
  %t837 = load i64, ptr %local.sigma
  %t838 = load i64, ptr %local.lambda
  %t839 = load i64, ptr %local.lambda2
  %t840 = load i64, ptr %local.dt
  %t841 = call i64 @"step8"(i64 %t828, i64 %t829, i64 %t830, i64 %t831, i64 %t832, i64 %t833, i64 %t834, i64 %t835, i64 %t836, i64 %t837, i64 %t838, i64 %t839, i64 %t840, i64 1)
  store i64 %t841, ptr %local.n1.757
  %t842 = load i64, ptr %local.u.747
  %t843 = load i64, ptr %local.v.748
  %t844 = load i64, ptr %local.w.749
  %t845 = load i64, ptr %local.ox.750
  %t846 = load i64, ptr %local.oy.751
  %t847 = load i64, ptr %local.oz.752
  %t848 = load i64, ptr %local.ox2.753
  %t849 = load i64, ptr %local.oy2.754
  %t850 = load i64, ptr %local.nu
  %t851 = load i64, ptr %local.sigma
  %t852 = load i64, ptr %local.lambda
  %t853 = load i64, ptr %local.lambda2
  %t854 = load i64, ptr %local.dt
  %t855 = call i64 @"step8"(i64 %t842, i64 %t843, i64 %t844, i64 %t845, i64 %t846, i64 %t847, i64 %t848, i64 %t849, i64 %t850, i64 %t851, i64 %t852, i64 %t853, i64 %t854, i64 2)
  store i64 %t855, ptr %local.n2.758
  %t856 = load i64, ptr %local.u.747
  %t857 = load i64, ptr %local.v.748
  %t858 = load i64, ptr %local.w.749
  %t859 = load i64, ptr %local.ox.750
  %t860 = load i64, ptr %local.oy.751
  %t861 = load i64, ptr %local.oz.752
  %t862 = load i64, ptr %local.ox2.753
  %t863 = load i64, ptr %local.oy2.754
  %t864 = load i64, ptr %local.nu
  %t865 = load i64, ptr %local.sigma
  %t866 = load i64, ptr %local.lambda
  %t867 = load i64, ptr %local.lambda2
  %t868 = load i64, ptr %local.dt
  %t869 = call i64 @"step8"(i64 %t856, i64 %t857, i64 %t858, i64 %t859, i64 %t860, i64 %t861, i64 %t862, i64 %t863, i64 %t864, i64 %t865, i64 %t866, i64 %t867, i64 %t868, i64 3)
  store i64 %t869, ptr %local.n3.759
  %t870 = load i64, ptr %local.u.747
  %t871 = load i64, ptr %local.v.748
  %t872 = load i64, ptr %local.w.749
  %t873 = load i64, ptr %local.ox.750
  %t874 = load i64, ptr %local.oy.751
  %t875 = load i64, ptr %local.oz.752
  %t876 = load i64, ptr %local.ox2.753
  %t877 = load i64, ptr %local.oy2.754
  %t878 = load i64, ptr %local.nu
  %t879 = load i64, ptr %local.sigma
  %t880 = load i64, ptr %local.lambda
  %t881 = load i64, ptr %local.lambda2
  %t882 = load i64, ptr %local.dt
  %t883 = call i64 @"step8"(i64 %t870, i64 %t871, i64 %t872, i64 %t873, i64 %t874, i64 %t875, i64 %t876, i64 %t877, i64 %t878, i64 %t879, i64 %t880, i64 %t881, i64 %t882, i64 4)
  store i64 %t883, ptr %local.n4.760
  %t884 = load i64, ptr %local.u.747
  %t885 = load i64, ptr %local.v.748
  %t886 = load i64, ptr %local.w.749
  %t887 = load i64, ptr %local.ox.750
  %t888 = load i64, ptr %local.oy.751
  %t889 = load i64, ptr %local.oz.752
  %t890 = load i64, ptr %local.ox2.753
  %t891 = load i64, ptr %local.oy2.754
  %t892 = load i64, ptr %local.nu
  %t893 = load i64, ptr %local.sigma
  %t894 = load i64, ptr %local.lambda
  %t895 = load i64, ptr %local.lambda2
  %t896 = load i64, ptr %local.dt
  %t897 = call i64 @"step8"(i64 %t884, i64 %t885, i64 %t886, i64 %t887, i64 %t888, i64 %t889, i64 %t890, i64 %t891, i64 %t892, i64 %t893, i64 %t894, i64 %t895, i64 %t896, i64 5)
  store i64 %t897, ptr %local.n5.761
  %t898 = load i64, ptr %local.u.747
  %t899 = load i64, ptr %local.v.748
  %t900 = load i64, ptr %local.w.749
  %t901 = load i64, ptr %local.ox.750
  %t902 = load i64, ptr %local.oy.751
  %t903 = load i64, ptr %local.oz.752
  %t904 = load i64, ptr %local.ox2.753
  %t905 = load i64, ptr %local.oy2.754
  %t906 = load i64, ptr %local.nu
  %t907 = load i64, ptr %local.sigma
  %t908 = load i64, ptr %local.lambda
  %t909 = load i64, ptr %local.lambda2
  %t910 = load i64, ptr %local.dt
  %t911 = call i64 @"step8"(i64 %t898, i64 %t899, i64 %t900, i64 %t901, i64 %t902, i64 %t903, i64 %t904, i64 %t905, i64 %t906, i64 %t907, i64 %t908, i64 %t909, i64 %t910, i64 6)
  store i64 %t911, ptr %local.n6.762
  %t912 = load i64, ptr %local.u.747
  %t913 = load i64, ptr %local.v.748
  %t914 = load i64, ptr %local.w.749
  %t915 = load i64, ptr %local.ox.750
  %t916 = load i64, ptr %local.oy.751
  %t917 = load i64, ptr %local.oz.752
  %t918 = load i64, ptr %local.ox2.753
  %t919 = load i64, ptr %local.oy2.754
  %t920 = load i64, ptr %local.nu
  %t921 = load i64, ptr %local.sigma
  %t922 = load i64, ptr %local.lambda
  %t923 = load i64, ptr %local.lambda2
  %t924 = load i64, ptr %local.dt
  %t925 = call i64 @"step8"(i64 %t912, i64 %t913, i64 %t914, i64 %t915, i64 %t916, i64 %t917, i64 %t918, i64 %t919, i64 %t920, i64 %t921, i64 %t922, i64 %t923, i64 %t924, i64 7)
  store i64 %t925, ptr %local.n7.763
  %t926 = load i64, ptr %local.n0.756
  store i64 %t926, ptr %local.u.747
  %t927 = load i64, ptr %local.n1.757
  store i64 %t927, ptr %local.v.748
  %t928 = load i64, ptr %local.n2.758
  store i64 %t928, ptr %local.w.749
  %t929 = load i64, ptr %local.n3.759
  store i64 %t929, ptr %local.ox.750
  %t930 = load i64, ptr %local.n4.760
  store i64 %t930, ptr %local.oy.751
  %t931 = load i64, ptr %local.n5.761
  store i64 %t931, ptr %local.oz.752
  %t932 = load i64, ptr %local.n6.762
  store i64 %t932, ptr %local.ox2.753
  %t933 = load i64, ptr %local.n7.763
  store i64 %t933, ptr %local.oy2.754
  %t934 = load i64, ptr %local.s.755
  %t935 = add i64 %t934, 1
  store i64 %t935, ptr %local.s.755
  br label %loop21
endloop21:
  %t936 = load i64, ptr %local.which
  %t937 = icmp eq i64 %t936, 0
  %t938 = zext i1 %t937 to i64
  %t939 = icmp ne i64 %t938, 0
  br i1 %t939, label %then22, label %else22
then22:
  %t940 = load i64, ptr %local.u.747
  ret i64 %t940
else22:
  br label %else22_end
else22_end:
  br label %endif22
endif22:
  %t941 = phi i64 [ 0, %else22_end ]
  %t942 = load i64, ptr %local.which
  %t943 = icmp eq i64 %t942, 1
  %t944 = zext i1 %t943 to i64
  %t945 = icmp ne i64 %t944, 0
  br i1 %t945, label %then23, label %else23
then23:
  %t946 = load i64, ptr %local.v.748
  ret i64 %t946
else23:
  br label %else23_end
else23_end:
  br label %endif23
endif23:
  %t947 = phi i64 [ 0, %else23_end ]
  %t948 = load i64, ptr %local.which
  %t949 = icmp eq i64 %t948, 2
  %t950 = zext i1 %t949 to i64
  %t951 = icmp ne i64 %t950, 0
  br i1 %t951, label %then24, label %else24
then24:
  %t952 = load i64, ptr %local.w.749
  ret i64 %t952
else24:
  br label %else24_end
else24_end:
  br label %endif24
endif24:
  %t953 = phi i64 [ 0, %else24_end ]
  %t954 = load i64, ptr %local.which
  %t955 = icmp eq i64 %t954, 3
  %t956 = zext i1 %t955 to i64
  %t957 = icmp ne i64 %t956, 0
  br i1 %t957, label %then25, label %else25
then25:
  %t958 = load i64, ptr %local.ox.750
  ret i64 %t958
else25:
  br label %else25_end
else25_end:
  br label %endif25
endif25:
  %t959 = phi i64 [ 0, %else25_end ]
  %t960 = load i64, ptr %local.which
  %t961 = icmp eq i64 %t960, 4
  %t962 = zext i1 %t961 to i64
  %t963 = icmp ne i64 %t962, 0
  br i1 %t963, label %then26, label %else26
then26:
  %t964 = load i64, ptr %local.oy.751
  ret i64 %t964
else26:
  br label %else26_end
else26_end:
  br label %endif26
endif26:
  %t965 = phi i64 [ 0, %else26_end ]
  %t966 = load i64, ptr %local.oz.752
  ret i64 %t966
}

define i64 @"l2_diff_6_8"(i64 %amp, i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %steps) nounwind {
entry:
  %local.diff_sq.967 = alloca i64
  %local.comp.968 = alloca i64
  %local.v6.969 = alloca i64
  %local.v8.970 = alloca i64
  %local.d.971 = alloca i64
  %local.amp = alloca i64
  store i64 %amp, ptr %local.amp
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.steps = alloca i64
  store i64 %steps, ptr %local.steps
  %t972 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.61)
  store i64 %t972, ptr %local.diff_sq.967
  store i64 0, ptr %local.comp.968
  br label %loop27
loop27:
  %t973 = load i64, ptr %local.comp.968
  %t974 = icmp slt i64 %t973, 6
  %t975 = zext i1 %t974 to i64
  %t976 = icmp ne i64 %t975, 0
  br i1 %t976, label %body27, label %endloop27
body27:
  %t977 = load i64, ptr %local.amp
  %t978 = load i64, ptr %local.nu
  %t979 = load i64, ptr %local.sigma
  %t980 = load i64, ptr %local.lambda
  %t981 = load i64, ptr %local.lambda2
  %t982 = load i64, ptr %local.dt
  %t983 = load i64, ptr %local.steps
  %t984 = load i64, ptr %local.comp.968
  %t985 = call i64 @"run6_final"(i64 %t977, i64 %t978, i64 %t979, i64 %t980, i64 %t981, i64 %t982, i64 %t983, i64 %t984)
  store i64 %t985, ptr %local.v6.969
  %t986 = load i64, ptr %local.amp
  %t987 = load i64, ptr %local.nu
  %t988 = load i64, ptr %local.sigma
  %t989 = load i64, ptr %local.lambda
  %t990 = load i64, ptr %local.lambda2
  %t991 = load i64, ptr %local.dt
  %t992 = load i64, ptr %local.steps
  %t993 = load i64, ptr %local.comp.968
  %t994 = call i64 @"run8_final"(i64 %t986, i64 %t987, i64 %t988, i64 %t989, i64 %t990, i64 %t991, i64 %t992, i64 %t993)
  store i64 %t994, ptr %local.v8.970
  %t995 = load i64, ptr %local.v6.969
  %t996 = load i64, ptr %local.v8.970
  %t997 = call i64 @"sx_f64_sub"(i64 %t995, i64 %t996)
  store i64 %t997, ptr %local.d.971
  %t998 = load i64, ptr %local.diff_sq.967
  %t999 = load i64, ptr %local.d.971
  %t1000 = load i64, ptr %local.d.971
  %t1001 = call i64 @"sx_f64_mul"(i64 %t999, i64 %t1000)
  %t1002 = call i64 @"sx_f64_add"(i64 %t998, i64 %t1001)
  store i64 %t1002, ptr %local.diff_sq.967
  %t1003 = load i64, ptr %local.comp.968
  %t1004 = add i64 %t1003, 1
  store i64 %t1004, ptr %local.comp.968
  br label %loop27
endloop27:
  %t1005 = load i64, ptr %local.diff_sq.967
  %t1006 = call i64 @"my_sqrt"(i64 %t1005)
  ret i64 %t1006
}

define i64 @"find_astar_6"(i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.lo.1007 = alloca i64
  %local.hi.1008 = alloca i64
  %local.iter.1009 = alloca i64
  %local.mid.1010 = alloca i64
  %local.pi.1011 = alloca i64
  %local.u.1012 = alloca i64
  %local.v.1013 = alloca i64
  %local.w.1014 = alloca i64
  %local.ox.1015 = alloca i64
  %local.oy.1016 = alloca i64
  %local.oz.1017 = alloca i64
  %local.s.1018 = alloca i64
  %local.blowup.1019 = alloca i64
  %local.e.1020 = alloca i64
  %local.n0.1021 = alloca i64
  %local.n1.1022 = alloca i64
  %local.n2.1023 = alloca i64
  %local.n3.1024 = alloca i64
  %local.n4.1025 = alloca i64
  %local.n5.1026 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t1027 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.62)
  store i64 %t1027, ptr %local.lo.1007
  %t1028 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.63)
  store i64 %t1028, ptr %local.hi.1008
  store i64 0, ptr %local.iter.1009
  br label %loop28
loop28:
  %t1029 = load i64, ptr %local.iter.1009
  %t1030 = icmp slt i64 %t1029, 14
  %t1031 = zext i1 %t1030 to i64
  %t1032 = icmp ne i64 %t1031, 0
  br i1 %t1032, label %body28, label %endloop28
body28:
  %t1033 = load i64, ptr %local.lo.1007
  %t1034 = load i64, ptr %local.hi.1008
  %t1035 = call i64 @"sx_f64_add"(i64 %t1033, i64 %t1034)
  %t1036 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.64)
  %t1037 = call i64 @"sx_f64_div"(i64 %t1035, i64 %t1036)
  store i64 %t1037, ptr %local.mid.1010
  %t1038 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.65)
  store i64 %t1038, ptr %local.pi.1011
  %t1039 = load i64, ptr %local.mid.1010
  %t1040 = load i64, ptr %local.pi.1011
  %t1041 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.66)
  %t1042 = call i64 @"sx_f64_mul"(i64 %t1040, i64 %t1041)
  %t1043 = call i64 @"sin_f64"(i64 %t1042)
  %t1044 = call i64 @"sx_f64_mul"(i64 %t1039, i64 %t1043)
  store i64 %t1044, ptr %local.u.1012
  %t1045 = load i64, ptr %local.mid.1010
  %t1046 = load i64, ptr %local.pi.1011
  %t1047 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.67)
  %t1048 = call i64 @"sx_f64_mul"(i64 %t1046, i64 %t1047)
  %t1049 = call i64 @"sin_f64"(i64 %t1048)
  %t1050 = call i64 @"sx_f64_mul"(i64 %t1045, i64 %t1049)
  store i64 %t1050, ptr %local.v.1013
  %t1051 = load i64, ptr %local.mid.1010
  %t1052 = load i64, ptr %local.pi.1011
  %t1053 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.68)
  %t1054 = call i64 @"sx_f64_mul"(i64 %t1052, i64 %t1053)
  %t1055 = call i64 @"sin_f64"(i64 %t1054)
  %t1056 = call i64 @"sx_f64_mul"(i64 %t1051, i64 %t1055)
  store i64 %t1056, ptr %local.w.1014
  %t1057 = load i64, ptr %local.mid.1010
  %t1058 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.69)
  %t1059 = call i64 @"sx_f64_mul"(i64 %t1057, i64 %t1058)
  %t1060 = load i64, ptr %local.pi.1011
  %t1061 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.70)
  %t1062 = call i64 @"sx_f64_mul"(i64 %t1060, i64 %t1061)
  %t1063 = call i64 @"sin_f64"(i64 %t1062)
  %t1064 = call i64 @"sx_f64_mul"(i64 %t1059, i64 %t1063)
  store i64 %t1064, ptr %local.ox.1015
  %t1065 = load i64, ptr %local.mid.1010
  %t1066 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.71)
  %t1067 = call i64 @"sx_f64_mul"(i64 %t1065, i64 %t1066)
  %t1068 = load i64, ptr %local.pi.1011
  %t1069 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.72)
  %t1070 = call i64 @"sx_f64_mul"(i64 %t1068, i64 %t1069)
  %t1071 = call i64 @"sin_f64"(i64 %t1070)
  %t1072 = call i64 @"sx_f64_mul"(i64 %t1067, i64 %t1071)
  store i64 %t1072, ptr %local.oy.1016
  %t1073 = load i64, ptr %local.mid.1010
  %t1074 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.73)
  %t1075 = call i64 @"sx_f64_mul"(i64 %t1073, i64 %t1074)
  %t1076 = load i64, ptr %local.pi.1011
  %t1077 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.74)
  %t1078 = call i64 @"sx_f64_mul"(i64 %t1076, i64 %t1077)
  %t1079 = call i64 @"sin_f64"(i64 %t1078)
  %t1080 = call i64 @"sx_f64_mul"(i64 %t1075, i64 %t1079)
  store i64 %t1080, ptr %local.oz.1017
  store i64 0, ptr %local.s.1018
  store i64 0, ptr %local.blowup.1019
  br label %loop29
loop29:
  %t1081 = load i64, ptr %local.s.1018
  %t1082 = load i64, ptr %local.max_steps
  %t1083 = icmp slt i64 %t1081, %t1082
  %t1084 = zext i1 %t1083 to i64
  %t1085 = icmp ne i64 %t1084, 0
  br i1 %t1085, label %body29, label %endloop29
body29:
  %t1086 = load i64, ptr %local.ox.1015
  %t1087 = load i64, ptr %local.oy.1016
  %t1088 = load i64, ptr %local.oz.1017
  %t1089 = call i64 @"enstrophy"(i64 %t1086, i64 %t1087, i64 %t1088)
  store i64 %t1089, ptr %local.e.1020
  %t1090 = load i64, ptr %local.e.1020
  %t1091 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.75)
  %t1092 = call i64 @"sx_f64_gt"(i64 %t1090, i64 %t1091)
  %t1093 = icmp ne i64 %t1092, 0
  br i1 %t1093, label %then30, label %else30
then30:
  store i64 1, ptr %local.blowup.1019
  %t1094 = load i64, ptr %local.max_steps
  store i64 %t1094, ptr %local.s.1018
  br label %then30_end
then30_end:
  br label %endif30
else30:
  br label %else30_end
else30_end:
  br label %endif30
endif30:
  %t1095 = phi i64 [ 0, %then30_end ], [ 0, %else30_end ]
  %t1096 = load i64, ptr %local.u.1012
  %t1097 = load i64, ptr %local.v.1013
  %t1098 = load i64, ptr %local.w.1014
  %t1099 = load i64, ptr %local.ox.1015
  %t1100 = load i64, ptr %local.oy.1016
  %t1101 = load i64, ptr %local.oz.1017
  %t1102 = load i64, ptr %local.nu
  %t1103 = load i64, ptr %local.sigma
  %t1104 = load i64, ptr %local.lambda
  %t1105 = load i64, ptr %local.lambda2
  %t1106 = load i64, ptr %local.dt
  %t1107 = call i64 @"step6"(i64 %t1096, i64 %t1097, i64 %t1098, i64 %t1099, i64 %t1100, i64 %t1101, i64 %t1102, i64 %t1103, i64 %t1104, i64 %t1105, i64 %t1106, i64 0)
  store i64 %t1107, ptr %local.n0.1021
  %t1108 = load i64, ptr %local.u.1012
  %t1109 = load i64, ptr %local.v.1013
  %t1110 = load i64, ptr %local.w.1014
  %t1111 = load i64, ptr %local.ox.1015
  %t1112 = load i64, ptr %local.oy.1016
  %t1113 = load i64, ptr %local.oz.1017
  %t1114 = load i64, ptr %local.nu
  %t1115 = load i64, ptr %local.sigma
  %t1116 = load i64, ptr %local.lambda
  %t1117 = load i64, ptr %local.lambda2
  %t1118 = load i64, ptr %local.dt
  %t1119 = call i64 @"step6"(i64 %t1108, i64 %t1109, i64 %t1110, i64 %t1111, i64 %t1112, i64 %t1113, i64 %t1114, i64 %t1115, i64 %t1116, i64 %t1117, i64 %t1118, i64 1)
  store i64 %t1119, ptr %local.n1.1022
  %t1120 = load i64, ptr %local.u.1012
  %t1121 = load i64, ptr %local.v.1013
  %t1122 = load i64, ptr %local.w.1014
  %t1123 = load i64, ptr %local.ox.1015
  %t1124 = load i64, ptr %local.oy.1016
  %t1125 = load i64, ptr %local.oz.1017
  %t1126 = load i64, ptr %local.nu
  %t1127 = load i64, ptr %local.sigma
  %t1128 = load i64, ptr %local.lambda
  %t1129 = load i64, ptr %local.lambda2
  %t1130 = load i64, ptr %local.dt
  %t1131 = call i64 @"step6"(i64 %t1120, i64 %t1121, i64 %t1122, i64 %t1123, i64 %t1124, i64 %t1125, i64 %t1126, i64 %t1127, i64 %t1128, i64 %t1129, i64 %t1130, i64 2)
  store i64 %t1131, ptr %local.n2.1023
  %t1132 = load i64, ptr %local.u.1012
  %t1133 = load i64, ptr %local.v.1013
  %t1134 = load i64, ptr %local.w.1014
  %t1135 = load i64, ptr %local.ox.1015
  %t1136 = load i64, ptr %local.oy.1016
  %t1137 = load i64, ptr %local.oz.1017
  %t1138 = load i64, ptr %local.nu
  %t1139 = load i64, ptr %local.sigma
  %t1140 = load i64, ptr %local.lambda
  %t1141 = load i64, ptr %local.lambda2
  %t1142 = load i64, ptr %local.dt
  %t1143 = call i64 @"step6"(i64 %t1132, i64 %t1133, i64 %t1134, i64 %t1135, i64 %t1136, i64 %t1137, i64 %t1138, i64 %t1139, i64 %t1140, i64 %t1141, i64 %t1142, i64 3)
  store i64 %t1143, ptr %local.n3.1024
  %t1144 = load i64, ptr %local.u.1012
  %t1145 = load i64, ptr %local.v.1013
  %t1146 = load i64, ptr %local.w.1014
  %t1147 = load i64, ptr %local.ox.1015
  %t1148 = load i64, ptr %local.oy.1016
  %t1149 = load i64, ptr %local.oz.1017
  %t1150 = load i64, ptr %local.nu
  %t1151 = load i64, ptr %local.sigma
  %t1152 = load i64, ptr %local.lambda
  %t1153 = load i64, ptr %local.lambda2
  %t1154 = load i64, ptr %local.dt
  %t1155 = call i64 @"step6"(i64 %t1144, i64 %t1145, i64 %t1146, i64 %t1147, i64 %t1148, i64 %t1149, i64 %t1150, i64 %t1151, i64 %t1152, i64 %t1153, i64 %t1154, i64 4)
  store i64 %t1155, ptr %local.n4.1025
  %t1156 = load i64, ptr %local.u.1012
  %t1157 = load i64, ptr %local.v.1013
  %t1158 = load i64, ptr %local.w.1014
  %t1159 = load i64, ptr %local.ox.1015
  %t1160 = load i64, ptr %local.oy.1016
  %t1161 = load i64, ptr %local.oz.1017
  %t1162 = load i64, ptr %local.nu
  %t1163 = load i64, ptr %local.sigma
  %t1164 = load i64, ptr %local.lambda
  %t1165 = load i64, ptr %local.lambda2
  %t1166 = load i64, ptr %local.dt
  %t1167 = call i64 @"step6"(i64 %t1156, i64 %t1157, i64 %t1158, i64 %t1159, i64 %t1160, i64 %t1161, i64 %t1162, i64 %t1163, i64 %t1164, i64 %t1165, i64 %t1166, i64 5)
  store i64 %t1167, ptr %local.n5.1026
  %t1168 = load i64, ptr %local.n0.1021
  store i64 %t1168, ptr %local.u.1012
  %t1169 = load i64, ptr %local.n1.1022
  store i64 %t1169, ptr %local.v.1013
  %t1170 = load i64, ptr %local.n2.1023
  store i64 %t1170, ptr %local.w.1014
  %t1171 = load i64, ptr %local.n3.1024
  store i64 %t1171, ptr %local.ox.1015
  %t1172 = load i64, ptr %local.n4.1025
  store i64 %t1172, ptr %local.oy.1016
  %t1173 = load i64, ptr %local.n5.1026
  store i64 %t1173, ptr %local.oz.1017
  %t1174 = load i64, ptr %local.s.1018
  %t1175 = add i64 %t1174, 1
  store i64 %t1175, ptr %local.s.1018
  br label %loop29
endloop29:
  %t1176 = load i64, ptr %local.blowup.1019
  %t1177 = icmp eq i64 %t1176, 1
  %t1178 = zext i1 %t1177 to i64
  %t1179 = icmp ne i64 %t1178, 0
  br i1 %t1179, label %then31, label %else31
then31:
  %t1180 = load i64, ptr %local.mid.1010
  store i64 %t1180, ptr %local.hi.1008
  br label %then31_end
then31_end:
  br label %endif31
else31:
  %t1181 = load i64, ptr %local.mid.1010
  store i64 %t1181, ptr %local.lo.1007
  br label %else31_end
else31_end:
  br label %endif31
endif31:
  %t1182 = phi i64 [ 0, %then31_end ], [ 0, %else31_end ]
  %t1183 = load i64, ptr %local.iter.1009
  %t1184 = add i64 %t1183, 1
  store i64 %t1184, ptr %local.iter.1009
  br label %loop28
endloop28:
  %t1185 = load i64, ptr %local.lo.1007
  %t1186 = load i64, ptr %local.hi.1008
  %t1187 = call i64 @"sx_f64_add"(i64 %t1185, i64 %t1186)
  %t1188 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.76)
  %t1189 = call i64 @"sx_f64_div"(i64 %t1187, i64 %t1188)
  ret i64 %t1189
}

define i64 @"find_astar_8"(i64 %nu, i64 %sigma, i64 %lambda, i64 %lambda2, i64 %dt, i64 %max_steps) nounwind {
entry:
  %local.lo.1190 = alloca i64
  %local.hi.1191 = alloca i64
  %local.iter.1192 = alloca i64
  %local.mid.1193 = alloca i64
  %local.pi.1194 = alloca i64
  %local.u.1195 = alloca i64
  %local.v.1196 = alloca i64
  %local.w.1197 = alloca i64
  %local.ox.1198 = alloca i64
  %local.oy.1199 = alloca i64
  %local.oz.1200 = alloca i64
  %local.ox2.1201 = alloca i64
  %local.oy2.1202 = alloca i64
  %local.s.1203 = alloca i64
  %local.blowup.1204 = alloca i64
  %local.e.1205 = alloca i64
  %local.n0.1206 = alloca i64
  %local.n1.1207 = alloca i64
  %local.n2.1208 = alloca i64
  %local.n3.1209 = alloca i64
  %local.n4.1210 = alloca i64
  %local.n5.1211 = alloca i64
  %local.n6.1212 = alloca i64
  %local.n7.1213 = alloca i64
  %local.nu = alloca i64
  store i64 %nu, ptr %local.nu
  %local.sigma = alloca i64
  store i64 %sigma, ptr %local.sigma
  %local.lambda = alloca i64
  store i64 %lambda, ptr %local.lambda
  %local.lambda2 = alloca i64
  store i64 %lambda2, ptr %local.lambda2
  %local.dt = alloca i64
  store i64 %dt, ptr %local.dt
  %local.max_steps = alloca i64
  store i64 %max_steps, ptr %local.max_steps
  %t1214 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.77)
  store i64 %t1214, ptr %local.lo.1190
  %t1215 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.78)
  store i64 %t1215, ptr %local.hi.1191
  store i64 0, ptr %local.iter.1192
  br label %loop32
loop32:
  %t1216 = load i64, ptr %local.iter.1192
  %t1217 = icmp slt i64 %t1216, 14
  %t1218 = zext i1 %t1217 to i64
  %t1219 = icmp ne i64 %t1218, 0
  br i1 %t1219, label %body32, label %endloop32
body32:
  %t1220 = load i64, ptr %local.lo.1190
  %t1221 = load i64, ptr %local.hi.1191
  %t1222 = call i64 @"sx_f64_add"(i64 %t1220, i64 %t1221)
  %t1223 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.79)
  %t1224 = call i64 @"sx_f64_div"(i64 %t1222, i64 %t1223)
  store i64 %t1224, ptr %local.mid.1193
  %t1225 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.80)
  store i64 %t1225, ptr %local.pi.1194
  %t1226 = load i64, ptr %local.mid.1193
  %t1227 = load i64, ptr %local.pi.1194
  %t1228 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.81)
  %t1229 = call i64 @"sx_f64_mul"(i64 %t1227, i64 %t1228)
  %t1230 = call i64 @"sin_f64"(i64 %t1229)
  %t1231 = call i64 @"sx_f64_mul"(i64 %t1226, i64 %t1230)
  store i64 %t1231, ptr %local.u.1195
  %t1232 = load i64, ptr %local.mid.1193
  %t1233 = load i64, ptr %local.pi.1194
  %t1234 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.82)
  %t1235 = call i64 @"sx_f64_mul"(i64 %t1233, i64 %t1234)
  %t1236 = call i64 @"sin_f64"(i64 %t1235)
  %t1237 = call i64 @"sx_f64_mul"(i64 %t1232, i64 %t1236)
  store i64 %t1237, ptr %local.v.1196
  %t1238 = load i64, ptr %local.mid.1193
  %t1239 = load i64, ptr %local.pi.1194
  %t1240 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.83)
  %t1241 = call i64 @"sx_f64_mul"(i64 %t1239, i64 %t1240)
  %t1242 = call i64 @"sin_f64"(i64 %t1241)
  %t1243 = call i64 @"sx_f64_mul"(i64 %t1238, i64 %t1242)
  store i64 %t1243, ptr %local.w.1197
  %t1244 = load i64, ptr %local.mid.1193
  %t1245 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.84)
  %t1246 = call i64 @"sx_f64_mul"(i64 %t1244, i64 %t1245)
  %t1247 = load i64, ptr %local.pi.1194
  %t1248 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.85)
  %t1249 = call i64 @"sx_f64_mul"(i64 %t1247, i64 %t1248)
  %t1250 = call i64 @"sin_f64"(i64 %t1249)
  %t1251 = call i64 @"sx_f64_mul"(i64 %t1246, i64 %t1250)
  store i64 %t1251, ptr %local.ox.1198
  %t1252 = load i64, ptr %local.mid.1193
  %t1253 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.86)
  %t1254 = call i64 @"sx_f64_mul"(i64 %t1252, i64 %t1253)
  %t1255 = load i64, ptr %local.pi.1194
  %t1256 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.87)
  %t1257 = call i64 @"sx_f64_mul"(i64 %t1255, i64 %t1256)
  %t1258 = call i64 @"sin_f64"(i64 %t1257)
  %t1259 = call i64 @"sx_f64_mul"(i64 %t1254, i64 %t1258)
  store i64 %t1259, ptr %local.oy.1199
  %t1260 = load i64, ptr %local.mid.1193
  %t1261 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.88)
  %t1262 = call i64 @"sx_f64_mul"(i64 %t1260, i64 %t1261)
  %t1263 = load i64, ptr %local.pi.1194
  %t1264 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.89)
  %t1265 = call i64 @"sx_f64_mul"(i64 %t1263, i64 %t1264)
  %t1266 = call i64 @"sin_f64"(i64 %t1265)
  %t1267 = call i64 @"sx_f64_mul"(i64 %t1262, i64 %t1266)
  store i64 %t1267, ptr %local.oz.1200
  %t1268 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.90)
  store i64 %t1268, ptr %local.ox2.1201
  %t1269 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.91)
  store i64 %t1269, ptr %local.oy2.1202
  store i64 0, ptr %local.s.1203
  store i64 0, ptr %local.blowup.1204
  br label %loop33
loop33:
  %t1270 = load i64, ptr %local.s.1203
  %t1271 = load i64, ptr %local.max_steps
  %t1272 = icmp slt i64 %t1270, %t1271
  %t1273 = zext i1 %t1272 to i64
  %t1274 = icmp ne i64 %t1273, 0
  br i1 %t1274, label %body33, label %endloop33
body33:
  %t1275 = load i64, ptr %local.ox.1198
  %t1276 = load i64, ptr %local.oy.1199
  %t1277 = load i64, ptr %local.oz.1200
  %t1278 = call i64 @"enstrophy"(i64 %t1275, i64 %t1276, i64 %t1277)
  %t1279 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.92)
  %t1280 = load i64, ptr %local.ox2.1201
  %t1281 = load i64, ptr %local.ox2.1201
  %t1282 = call i64 @"sx_f64_mul"(i64 %t1280, i64 %t1281)
  %t1283 = load i64, ptr %local.oy2.1202
  %t1284 = load i64, ptr %local.oy2.1202
  %t1285 = call i64 @"sx_f64_mul"(i64 %t1283, i64 %t1284)
  %t1286 = call i64 @"sx_f64_add"(i64 %t1282, i64 %t1285)
  %t1287 = call i64 @"sx_f64_mul"(i64 %t1279, i64 %t1286)
  %t1288 = call i64 @"sx_f64_add"(i64 %t1278, i64 %t1287)
  store i64 %t1288, ptr %local.e.1205
  %t1289 = load i64, ptr %local.e.1205
  %t1290 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.93)
  %t1291 = call i64 @"sx_f64_gt"(i64 %t1289, i64 %t1290)
  %t1292 = icmp ne i64 %t1291, 0
  br i1 %t1292, label %then34, label %else34
then34:
  store i64 1, ptr %local.blowup.1204
  %t1293 = load i64, ptr %local.max_steps
  store i64 %t1293, ptr %local.s.1203
  br label %then34_end
then34_end:
  br label %endif34
else34:
  br label %else34_end
else34_end:
  br label %endif34
endif34:
  %t1294 = phi i64 [ 0, %then34_end ], [ 0, %else34_end ]
  %t1295 = load i64, ptr %local.u.1195
  %t1296 = load i64, ptr %local.v.1196
  %t1297 = load i64, ptr %local.w.1197
  %t1298 = load i64, ptr %local.ox.1198
  %t1299 = load i64, ptr %local.oy.1199
  %t1300 = load i64, ptr %local.oz.1200
  %t1301 = load i64, ptr %local.ox2.1201
  %t1302 = load i64, ptr %local.oy2.1202
  %t1303 = load i64, ptr %local.nu
  %t1304 = load i64, ptr %local.sigma
  %t1305 = load i64, ptr %local.lambda
  %t1306 = load i64, ptr %local.lambda2
  %t1307 = load i64, ptr %local.dt
  %t1308 = call i64 @"step8"(i64 %t1295, i64 %t1296, i64 %t1297, i64 %t1298, i64 %t1299, i64 %t1300, i64 %t1301, i64 %t1302, i64 %t1303, i64 %t1304, i64 %t1305, i64 %t1306, i64 %t1307, i64 0)
  store i64 %t1308, ptr %local.n0.1206
  %t1309 = load i64, ptr %local.u.1195
  %t1310 = load i64, ptr %local.v.1196
  %t1311 = load i64, ptr %local.w.1197
  %t1312 = load i64, ptr %local.ox.1198
  %t1313 = load i64, ptr %local.oy.1199
  %t1314 = load i64, ptr %local.oz.1200
  %t1315 = load i64, ptr %local.ox2.1201
  %t1316 = load i64, ptr %local.oy2.1202
  %t1317 = load i64, ptr %local.nu
  %t1318 = load i64, ptr %local.sigma
  %t1319 = load i64, ptr %local.lambda
  %t1320 = load i64, ptr %local.lambda2
  %t1321 = load i64, ptr %local.dt
  %t1322 = call i64 @"step8"(i64 %t1309, i64 %t1310, i64 %t1311, i64 %t1312, i64 %t1313, i64 %t1314, i64 %t1315, i64 %t1316, i64 %t1317, i64 %t1318, i64 %t1319, i64 %t1320, i64 %t1321, i64 1)
  store i64 %t1322, ptr %local.n1.1207
  %t1323 = load i64, ptr %local.u.1195
  %t1324 = load i64, ptr %local.v.1196
  %t1325 = load i64, ptr %local.w.1197
  %t1326 = load i64, ptr %local.ox.1198
  %t1327 = load i64, ptr %local.oy.1199
  %t1328 = load i64, ptr %local.oz.1200
  %t1329 = load i64, ptr %local.ox2.1201
  %t1330 = load i64, ptr %local.oy2.1202
  %t1331 = load i64, ptr %local.nu
  %t1332 = load i64, ptr %local.sigma
  %t1333 = load i64, ptr %local.lambda
  %t1334 = load i64, ptr %local.lambda2
  %t1335 = load i64, ptr %local.dt
  %t1336 = call i64 @"step8"(i64 %t1323, i64 %t1324, i64 %t1325, i64 %t1326, i64 %t1327, i64 %t1328, i64 %t1329, i64 %t1330, i64 %t1331, i64 %t1332, i64 %t1333, i64 %t1334, i64 %t1335, i64 2)
  store i64 %t1336, ptr %local.n2.1208
  %t1337 = load i64, ptr %local.u.1195
  %t1338 = load i64, ptr %local.v.1196
  %t1339 = load i64, ptr %local.w.1197
  %t1340 = load i64, ptr %local.ox.1198
  %t1341 = load i64, ptr %local.oy.1199
  %t1342 = load i64, ptr %local.oz.1200
  %t1343 = load i64, ptr %local.ox2.1201
  %t1344 = load i64, ptr %local.oy2.1202
  %t1345 = load i64, ptr %local.nu
  %t1346 = load i64, ptr %local.sigma
  %t1347 = load i64, ptr %local.lambda
  %t1348 = load i64, ptr %local.lambda2
  %t1349 = load i64, ptr %local.dt
  %t1350 = call i64 @"step8"(i64 %t1337, i64 %t1338, i64 %t1339, i64 %t1340, i64 %t1341, i64 %t1342, i64 %t1343, i64 %t1344, i64 %t1345, i64 %t1346, i64 %t1347, i64 %t1348, i64 %t1349, i64 3)
  store i64 %t1350, ptr %local.n3.1209
  %t1351 = load i64, ptr %local.u.1195
  %t1352 = load i64, ptr %local.v.1196
  %t1353 = load i64, ptr %local.w.1197
  %t1354 = load i64, ptr %local.ox.1198
  %t1355 = load i64, ptr %local.oy.1199
  %t1356 = load i64, ptr %local.oz.1200
  %t1357 = load i64, ptr %local.ox2.1201
  %t1358 = load i64, ptr %local.oy2.1202
  %t1359 = load i64, ptr %local.nu
  %t1360 = load i64, ptr %local.sigma
  %t1361 = load i64, ptr %local.lambda
  %t1362 = load i64, ptr %local.lambda2
  %t1363 = load i64, ptr %local.dt
  %t1364 = call i64 @"step8"(i64 %t1351, i64 %t1352, i64 %t1353, i64 %t1354, i64 %t1355, i64 %t1356, i64 %t1357, i64 %t1358, i64 %t1359, i64 %t1360, i64 %t1361, i64 %t1362, i64 %t1363, i64 4)
  store i64 %t1364, ptr %local.n4.1210
  %t1365 = load i64, ptr %local.u.1195
  %t1366 = load i64, ptr %local.v.1196
  %t1367 = load i64, ptr %local.w.1197
  %t1368 = load i64, ptr %local.ox.1198
  %t1369 = load i64, ptr %local.oy.1199
  %t1370 = load i64, ptr %local.oz.1200
  %t1371 = load i64, ptr %local.ox2.1201
  %t1372 = load i64, ptr %local.oy2.1202
  %t1373 = load i64, ptr %local.nu
  %t1374 = load i64, ptr %local.sigma
  %t1375 = load i64, ptr %local.lambda
  %t1376 = load i64, ptr %local.lambda2
  %t1377 = load i64, ptr %local.dt
  %t1378 = call i64 @"step8"(i64 %t1365, i64 %t1366, i64 %t1367, i64 %t1368, i64 %t1369, i64 %t1370, i64 %t1371, i64 %t1372, i64 %t1373, i64 %t1374, i64 %t1375, i64 %t1376, i64 %t1377, i64 5)
  store i64 %t1378, ptr %local.n5.1211
  %t1379 = load i64, ptr %local.u.1195
  %t1380 = load i64, ptr %local.v.1196
  %t1381 = load i64, ptr %local.w.1197
  %t1382 = load i64, ptr %local.ox.1198
  %t1383 = load i64, ptr %local.oy.1199
  %t1384 = load i64, ptr %local.oz.1200
  %t1385 = load i64, ptr %local.ox2.1201
  %t1386 = load i64, ptr %local.oy2.1202
  %t1387 = load i64, ptr %local.nu
  %t1388 = load i64, ptr %local.sigma
  %t1389 = load i64, ptr %local.lambda
  %t1390 = load i64, ptr %local.lambda2
  %t1391 = load i64, ptr %local.dt
  %t1392 = call i64 @"step8"(i64 %t1379, i64 %t1380, i64 %t1381, i64 %t1382, i64 %t1383, i64 %t1384, i64 %t1385, i64 %t1386, i64 %t1387, i64 %t1388, i64 %t1389, i64 %t1390, i64 %t1391, i64 6)
  store i64 %t1392, ptr %local.n6.1212
  %t1393 = load i64, ptr %local.u.1195
  %t1394 = load i64, ptr %local.v.1196
  %t1395 = load i64, ptr %local.w.1197
  %t1396 = load i64, ptr %local.ox.1198
  %t1397 = load i64, ptr %local.oy.1199
  %t1398 = load i64, ptr %local.oz.1200
  %t1399 = load i64, ptr %local.ox2.1201
  %t1400 = load i64, ptr %local.oy2.1202
  %t1401 = load i64, ptr %local.nu
  %t1402 = load i64, ptr %local.sigma
  %t1403 = load i64, ptr %local.lambda
  %t1404 = load i64, ptr %local.lambda2
  %t1405 = load i64, ptr %local.dt
  %t1406 = call i64 @"step8"(i64 %t1393, i64 %t1394, i64 %t1395, i64 %t1396, i64 %t1397, i64 %t1398, i64 %t1399, i64 %t1400, i64 %t1401, i64 %t1402, i64 %t1403, i64 %t1404, i64 %t1405, i64 7)
  store i64 %t1406, ptr %local.n7.1213
  %t1407 = load i64, ptr %local.n0.1206
  store i64 %t1407, ptr %local.u.1195
  %t1408 = load i64, ptr %local.n1.1207
  store i64 %t1408, ptr %local.v.1196
  %t1409 = load i64, ptr %local.n2.1208
  store i64 %t1409, ptr %local.w.1197
  %t1410 = load i64, ptr %local.n3.1209
  store i64 %t1410, ptr %local.ox.1198
  %t1411 = load i64, ptr %local.n4.1210
  store i64 %t1411, ptr %local.oy.1199
  %t1412 = load i64, ptr %local.n5.1211
  store i64 %t1412, ptr %local.oz.1200
  %t1413 = load i64, ptr %local.n6.1212
  store i64 %t1413, ptr %local.ox2.1201
  %t1414 = load i64, ptr %local.n7.1213
  store i64 %t1414, ptr %local.oy2.1202
  %t1415 = load i64, ptr %local.s.1203
  %t1416 = add i64 %t1415, 1
  store i64 %t1416, ptr %local.s.1203
  br label %loop33
endloop33:
  %t1417 = load i64, ptr %local.blowup.1204
  %t1418 = icmp eq i64 %t1417, 1
  %t1419 = zext i1 %t1418 to i64
  %t1420 = icmp ne i64 %t1419, 0
  br i1 %t1420, label %then35, label %else35
then35:
  %t1421 = load i64, ptr %local.mid.1193
  store i64 %t1421, ptr %local.hi.1191
  br label %then35_end
then35_end:
  br label %endif35
else35:
  %t1422 = load i64, ptr %local.mid.1193
  store i64 %t1422, ptr %local.lo.1190
  br label %else35_end
else35_end:
  br label %endif35
endif35:
  %t1423 = phi i64 [ 0, %then35_end ], [ 0, %else35_end ]
  %t1424 = load i64, ptr %local.iter.1192
  %t1425 = add i64 %t1424, 1
  store i64 %t1425, ptr %local.iter.1192
  br label %loop32
endloop32:
  %t1426 = load i64, ptr %local.lo.1190
  %t1427 = load i64, ptr %local.hi.1191
  %t1428 = call i64 @"sx_f64_add"(i64 %t1426, i64 %t1427)
  %t1429 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.94)
  %t1430 = call i64 @"sx_f64_div"(i64 %t1428, i64 %t1429)
  ret i64 %t1430
}

define i64 @"simplex_main"() nounwind {
entry:
  %local.nu.1431 = alloca i64
  %local.sigma.1432 = alloca i64
  %local.lambda.1433 = alloca i64
  %local.lambda2.1434 = alloca i64
  %local.dt.1435 = alloca i64
  %local.max_steps.1436 = alloca i64
  %local.astar_6.1437 = alloca i64
  %local.astar_8.1438 = alloca i64
  %local.delta_astar.1439 = alloca i64
  %local.amp_idx.1440 = alloca i64
  %local.amp.1441 = alloca i64
  %local.diff.1442 = alloca i64
  %local.ratio_astar.1443 = alloca i64
  %local.rel_diff.1444 = alloca i64
  %local.amp_track.1445 = alloca i64
  %local.pi.1446 = alloca i64
  %local.u6.1447 = alloca i64
  %local.v6.1448 = alloca i64
  %local.w6.1449 = alloca i64
  %local.ox6.1450 = alloca i64
  %local.oy6.1451 = alloca i64
  %local.oz6.1452 = alloca i64
  %local.u8.1453 = alloca i64
  %local.v8.1454 = alloca i64
  %local.w8.1455 = alloca i64
  %local.ox8.1456 = alloca i64
  %local.oy8.1457 = alloca i64
  %local.oz8.1458 = alloca i64
  %local.ox28.1459 = alloca i64
  %local.oy28.1460 = alloca i64
  %local.s.1461 = alloca i64
  %local.prev_diff.1462 = alloca i64
  %local.du.1463 = alloca i64
  %local.dv.1464 = alloca i64
  %local.dw.1465 = alloca i64
  %local.dox.1466 = alloca i64
  %local.doy.1467 = alloca i64
  %local.doz.1468 = alloca i64
  %local.diff.1469 = alloca i64
  %local.time.1470 = alloca i64
  %local.a0.1471 = alloca i64
  %local.a1.1472 = alloca i64
  %local.a2.1473 = alloca i64
  %local.a3.1474 = alloca i64
  %local.a4.1475 = alloca i64
  %local.a5.1476 = alloca i64
  %local.b0.1477 = alloca i64
  %local.b1.1478 = alloca i64
  %local.b2.1479 = alloca i64
  %local.b3.1480 = alloca i64
  %local.b4.1481 = alloca i64
  %local.b5.1482 = alloca i64
  %local.b6.1483 = alloca i64
  %local.b7.1484 = alloca i64
  %t1485 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.95)
  store i64 %t1485, ptr %local.nu.1431
  %t1486 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.96)
  store i64 %t1486, ptr %local.sigma.1432
  %t1487 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.97)
  store i64 %t1487, ptr %local.lambda.1433
  %t1488 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.98)
  store i64 %t1488, ptr %local.lambda2.1434
  %t1489 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.99)
  store i64 %t1489, ptr %local.dt.1435
  store i64 50000, ptr %local.max_steps.1436
  %t1490 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.100)
  %t1491 = ptrtoint ptr %t1490 to i64
  %t1492 = inttoptr i64 %t1491 to ptr
  call void @intrinsic_println(ptr %t1492)
  %t1493 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.101)
  %t1494 = ptrtoint ptr %t1493 to i64
  %t1495 = inttoptr i64 %t1494 to ptr
  call void @intrinsic_println(ptr %t1495)
  %t1496 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.102)
  %t1497 = ptrtoint ptr %t1496 to i64
  %t1498 = inttoptr i64 %t1497 to ptr
  call void @intrinsic_println(ptr %t1498)
  %t1499 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.103)
  %t1500 = ptrtoint ptr %t1499 to i64
  %t1501 = inttoptr i64 %t1500 to ptr
  call void @intrinsic_println(ptr %t1501)
  %t1502 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.104)
  %t1503 = ptrtoint ptr %t1502 to i64
  %t1504 = inttoptr i64 %t1503 to ptr
  call void @intrinsic_println(ptr %t1504)
  %t1505 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.105)
  %t1506 = ptrtoint ptr %t1505 to i64
  %t1507 = inttoptr i64 %t1506 to ptr
  call void @intrinsic_println(ptr %t1507)
  %t1508 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.106)
  %t1509 = ptrtoint ptr %t1508 to i64
  %t1510 = inttoptr i64 %t1509 to ptr
  call void @intrinsic_println(ptr %t1510)
  %t1511 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.107)
  %t1512 = ptrtoint ptr %t1511 to i64
  %t1513 = inttoptr i64 %t1512 to ptr
  call void @intrinsic_println(ptr %t1513)
  %t1514 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.108)
  %t1515 = ptrtoint ptr %t1514 to i64
  %t1516 = inttoptr i64 %t1515 to ptr
  call void @intrinsic_println(ptr %t1516)
  %t1517 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.109)
  %t1518 = ptrtoint ptr %t1517 to i64
  %t1519 = inttoptr i64 %t1518 to ptr
  call void @intrinsic_println(ptr %t1519)
  %t1520 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.110)
  %t1521 = ptrtoint ptr %t1520 to i64
  %t1522 = inttoptr i64 %t1521 to ptr
  call void @intrinsic_println(ptr %t1522)
  %t1523 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.111)
  %t1524 = ptrtoint ptr %t1523 to i64
  %t1525 = inttoptr i64 %t1524 to ptr
  call void @intrinsic_println(ptr %t1525)
  %t1526 = load i64, ptr %local.nu.1431
  %t1527 = load i64, ptr %local.sigma.1432
  %t1528 = load i64, ptr %local.lambda.1433
  %t1529 = load i64, ptr %local.lambda2.1434
  %t1530 = load i64, ptr %local.dt.1435
  %t1531 = load i64, ptr %local.max_steps.1436
  %t1532 = call i64 @"find_astar_6"(i64 %t1526, i64 %t1527, i64 %t1528, i64 %t1529, i64 %t1530, i64 %t1531)
  store i64 %t1532, ptr %local.astar_6.1437
  %t1533 = load i64, ptr %local.nu.1431
  %t1534 = load i64, ptr %local.sigma.1432
  %t1535 = load i64, ptr %local.lambda.1433
  %t1536 = load i64, ptr %local.lambda2.1434
  %t1537 = load i64, ptr %local.dt.1435
  %t1538 = load i64, ptr %local.max_steps.1436
  %t1539 = call i64 @"find_astar_8"(i64 %t1533, i64 %t1534, i64 %t1535, i64 %t1536, i64 %t1537, i64 %t1538)
  store i64 %t1539, ptr %local.astar_8.1438
  %t1540 = load i64, ptr %local.astar_8.1438
  %t1541 = load i64, ptr %local.astar_6.1437
  %t1542 = call i64 @"sx_f64_sub"(i64 %t1540, i64 %t1541)
  store i64 %t1542, ptr %local.delta_astar.1439
  %t1543 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.112)
  %t1544 = ptrtoint ptr %t1543 to i64
  %t1545 = inttoptr i64 %t1544 to ptr
  call void @intrinsic_print(ptr %t1545)
  %t1546 = load i64, ptr %local.astar_6.1437
  %t1547 = call i64 @"print_f64"(i64 %t1546)
  %t1548 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.113)
  %t1549 = ptrtoint ptr %t1548 to i64
  %t1550 = inttoptr i64 %t1549 to ptr
  call void @intrinsic_println(ptr %t1550)
  %t1551 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.114)
  %t1552 = ptrtoint ptr %t1551 to i64
  %t1553 = inttoptr i64 %t1552 to ptr
  call void @intrinsic_print(ptr %t1553)
  %t1554 = load i64, ptr %local.astar_8.1438
  %t1555 = call i64 @"print_f64"(i64 %t1554)
  %t1556 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.115)
  %t1557 = ptrtoint ptr %t1556 to i64
  %t1558 = inttoptr i64 %t1557 to ptr
  call void @intrinsic_println(ptr %t1558)
  %t1559 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.116)
  %t1560 = ptrtoint ptr %t1559 to i64
  %t1561 = inttoptr i64 %t1560 to ptr
  call void @intrinsic_print(ptr %t1561)
  %t1562 = load i64, ptr %local.delta_astar.1439
  %t1563 = call i64 @"print_f64"(i64 %t1562)
  %t1564 = load i64, ptr %local.delta_astar.1439
  %t1565 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.117)
  %t1566 = call i64 @"sx_f64_ge"(i64 %t1564, i64 %t1565)
  %t1567 = icmp ne i64 %t1566, 0
  br i1 %t1567, label %then36, label %else36
then36:
  %t1568 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.118)
  %t1569 = ptrtoint ptr %t1568 to i64
  %t1570 = inttoptr i64 %t1569 to ptr
  call void @intrinsic_println(ptr %t1570)
  br label %then36_end
then36_end:
  br label %endif36
else36:
  %t1571 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.119)
  %t1572 = ptrtoint ptr %t1571 to i64
  %t1573 = inttoptr i64 %t1572 to ptr
  call void @intrinsic_println(ptr %t1573)
  br label %else36_end
else36_end:
  br label %endif36
endif36:
  %t1574 = phi i64 [ 0, %then36_end ], [ 0, %else36_end ]
  %t1575 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.120)
  %t1576 = ptrtoint ptr %t1575 to i64
  %t1577 = inttoptr i64 %t1576 to ptr
  call void @intrinsic_println(ptr %t1577)
  %t1578 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.121)
  %t1579 = ptrtoint ptr %t1578 to i64
  %t1580 = inttoptr i64 %t1579 to ptr
  call void @intrinsic_println(ptr %t1580)
  %t1581 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.122)
  %t1582 = ptrtoint ptr %t1581 to i64
  %t1583 = inttoptr i64 %t1582 to ptr
  call void @intrinsic_println(ptr %t1583)
  %t1584 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.123)
  %t1585 = ptrtoint ptr %t1584 to i64
  %t1586 = inttoptr i64 %t1585 to ptr
  call void @intrinsic_println(ptr %t1586)
  %t1587 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.124)
  %t1588 = ptrtoint ptr %t1587 to i64
  %t1589 = inttoptr i64 %t1588 to ptr
  call void @intrinsic_println(ptr %t1589)
  store i64 0, ptr %local.amp_idx.1440
  br label %loop37
loop37:
  %t1590 = load i64, ptr %local.amp_idx.1440
  %t1591 = icmp slt i64 %t1590, 8
  %t1592 = zext i1 %t1591 to i64
  %t1593 = icmp ne i64 %t1592, 0
  br i1 %t1593, label %body37, label %endloop37
body37:
  %t1594 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.125)
  store i64 %t1594, ptr %local.amp.1441
  %t1595 = load i64, ptr %local.amp_idx.1440
  %t1596 = icmp eq i64 %t1595, 0
  %t1597 = zext i1 %t1596 to i64
  %t1598 = icmp ne i64 %t1597, 0
  br i1 %t1598, label %then38, label %else38
then38:
  %t1599 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.126)
  store i64 %t1599, ptr %local.amp.1441
  br label %then38_end
then38_end:
  br label %endif38
else38:
  br label %else38_end
else38_end:
  br label %endif38
endif38:
  %t1600 = phi i64 [ 0, %then38_end ], [ 0, %else38_end ]
  %t1601 = load i64, ptr %local.amp_idx.1440
  %t1602 = icmp eq i64 %t1601, 1
  %t1603 = zext i1 %t1602 to i64
  %t1604 = icmp ne i64 %t1603, 0
  br i1 %t1604, label %then39, label %else39
then39:
  %t1605 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.127)
  store i64 %t1605, ptr %local.amp.1441
  br label %then39_end
then39_end:
  br label %endif39
else39:
  br label %else39_end
else39_end:
  br label %endif39
endif39:
  %t1606 = phi i64 [ 0, %then39_end ], [ 0, %else39_end ]
  %t1607 = load i64, ptr %local.amp_idx.1440
  %t1608 = icmp eq i64 %t1607, 2
  %t1609 = zext i1 %t1608 to i64
  %t1610 = icmp ne i64 %t1609, 0
  br i1 %t1610, label %then40, label %else40
then40:
  %t1611 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.128)
  store i64 %t1611, ptr %local.amp.1441
  br label %then40_end
then40_end:
  br label %endif40
else40:
  br label %else40_end
else40_end:
  br label %endif40
endif40:
  %t1612 = phi i64 [ 0, %then40_end ], [ 0, %else40_end ]
  %t1613 = load i64, ptr %local.amp_idx.1440
  %t1614 = icmp eq i64 %t1613, 3
  %t1615 = zext i1 %t1614 to i64
  %t1616 = icmp ne i64 %t1615, 0
  br i1 %t1616, label %then41, label %else41
then41:
  %t1617 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.129)
  store i64 %t1617, ptr %local.amp.1441
  br label %then41_end
then41_end:
  br label %endif41
else41:
  br label %else41_end
else41_end:
  br label %endif41
endif41:
  %t1618 = phi i64 [ 0, %then41_end ], [ 0, %else41_end ]
  %t1619 = load i64, ptr %local.amp_idx.1440
  %t1620 = icmp eq i64 %t1619, 4
  %t1621 = zext i1 %t1620 to i64
  %t1622 = icmp ne i64 %t1621, 0
  br i1 %t1622, label %then42, label %else42
then42:
  %t1623 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.130)
  store i64 %t1623, ptr %local.amp.1441
  br label %then42_end
then42_end:
  br label %endif42
else42:
  br label %else42_end
else42_end:
  br label %endif42
endif42:
  %t1624 = phi i64 [ 0, %then42_end ], [ 0, %else42_end ]
  %t1625 = load i64, ptr %local.amp_idx.1440
  %t1626 = icmp eq i64 %t1625, 5
  %t1627 = zext i1 %t1626 to i64
  %t1628 = icmp ne i64 %t1627, 0
  br i1 %t1628, label %then43, label %else43
then43:
  %t1629 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.131)
  store i64 %t1629, ptr %local.amp.1441
  br label %then43_end
then43_end:
  br label %endif43
else43:
  br label %else43_end
else43_end:
  br label %endif43
endif43:
  %t1630 = phi i64 [ 0, %then43_end ], [ 0, %else43_end ]
  %t1631 = load i64, ptr %local.amp_idx.1440
  %t1632 = icmp eq i64 %t1631, 6
  %t1633 = zext i1 %t1632 to i64
  %t1634 = icmp ne i64 %t1633, 0
  br i1 %t1634, label %then44, label %else44
then44:
  %t1635 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.132)
  store i64 %t1635, ptr %local.amp.1441
  br label %then44_end
then44_end:
  br label %endif44
else44:
  br label %else44_end
else44_end:
  br label %endif44
endif44:
  %t1636 = phi i64 [ 0, %then44_end ], [ 0, %else44_end ]
  %t1637 = load i64, ptr %local.amp_idx.1440
  %t1638 = icmp eq i64 %t1637, 7
  %t1639 = zext i1 %t1638 to i64
  %t1640 = icmp ne i64 %t1639, 0
  br i1 %t1640, label %then45, label %else45
then45:
  %t1641 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.133)
  store i64 %t1641, ptr %local.amp.1441
  br label %then45_end
then45_end:
  br label %endif45
else45:
  br label %else45_end
else45_end:
  br label %endif45
endif45:
  %t1642 = phi i64 [ 0, %then45_end ], [ 0, %else45_end ]
  %t1643 = load i64, ptr %local.amp.1441
  %t1644 = load i64, ptr %local.nu.1431
  %t1645 = load i64, ptr %local.sigma.1432
  %t1646 = load i64, ptr %local.lambda.1433
  %t1647 = load i64, ptr %local.lambda2.1434
  %t1648 = load i64, ptr %local.dt.1435
  %t1649 = load i64, ptr %local.max_steps.1436
  %t1650 = call i64 @"l2_diff_6_8"(i64 %t1643, i64 %t1644, i64 %t1645, i64 %t1646, i64 %t1647, i64 %t1648, i64 %t1649)
  store i64 %t1650, ptr %local.diff.1442
  %t1651 = load i64, ptr %local.amp.1441
  %t1652 = load i64, ptr %local.astar_6.1437
  %t1653 = call i64 @"sx_f64_div"(i64 %t1651, i64 %t1652)
  store i64 %t1653, ptr %local.ratio_astar.1443
  %t1654 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.134)
  store i64 %t1654, ptr %local.rel_diff.1444
  %t1655 = load i64, ptr %local.amp.1441
  %t1656 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.135)
  %t1657 = call i64 @"sx_f64_gt"(i64 %t1655, i64 %t1656)
  %t1658 = icmp ne i64 %t1657, 0
  br i1 %t1658, label %then46, label %else46
then46:
  %t1659 = load i64, ptr %local.diff.1442
  %t1660 = load i64, ptr %local.amp.1441
  %t1661 = call i64 @"sx_f64_div"(i64 %t1659, i64 %t1660)
  store i64 %t1661, ptr %local.rel_diff.1444
  br label %then46_end
then46_end:
  br label %endif46
else46:
  br label %else46_end
else46_end:
  br label %endif46
endif46:
  %t1662 = phi i64 [ 0, %then46_end ], [ 0, %else46_end ]
  %t1663 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.136)
  %t1664 = ptrtoint ptr %t1663 to i64
  %t1665 = inttoptr i64 %t1664 to ptr
  call void @intrinsic_print(ptr %t1665)
  %t1666 = load i64, ptr %local.amp.1441
  %t1667 = call i64 @"print_f64"(i64 %t1666)
  %t1668 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.137)
  %t1669 = ptrtoint ptr %t1668 to i64
  %t1670 = inttoptr i64 %t1669 to ptr
  call void @intrinsic_print(ptr %t1670)
  %t1671 = load i64, ptr %local.diff.1442
  %t1672 = call i64 @"print_f64"(i64 %t1671)
  %t1673 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.138)
  %t1674 = ptrtoint ptr %t1673 to i64
  %t1675 = inttoptr i64 %t1674 to ptr
  call void @intrinsic_print(ptr %t1675)
  %t1676 = load i64, ptr %local.ratio_astar.1443
  %t1677 = call i64 @"print_f64"(i64 %t1676)
  %t1678 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.139)
  %t1679 = ptrtoint ptr %t1678 to i64
  %t1680 = inttoptr i64 %t1679 to ptr
  call void @intrinsic_print(ptr %t1680)
  %t1681 = load i64, ptr %local.rel_diff.1444
  %t1682 = call i64 @"print_f64"(i64 %t1681)
  %t1683 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.140)
  %t1684 = ptrtoint ptr %t1683 to i64
  %t1685 = inttoptr i64 %t1684 to ptr
  call void @intrinsic_println(ptr %t1685)
  %t1686 = load i64, ptr %local.amp_idx.1440
  %t1687 = add i64 %t1686, 1
  store i64 %t1687, ptr %local.amp_idx.1440
  br label %loop37
endloop37:
  %t1688 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.141)
  %t1689 = ptrtoint ptr %t1688 to i64
  %t1690 = inttoptr i64 %t1689 to ptr
  call void @intrinsic_println(ptr %t1690)
  %t1691 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.142)
  %t1692 = ptrtoint ptr %t1691 to i64
  %t1693 = inttoptr i64 %t1692 to ptr
  call void @intrinsic_println(ptr %t1693)
  %t1694 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.143)
  %t1695 = ptrtoint ptr %t1694 to i64
  %t1696 = inttoptr i64 %t1695 to ptr
  call void @intrinsic_println(ptr %t1696)
  %t1697 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.144)
  %t1698 = ptrtoint ptr %t1697 to i64
  %t1699 = inttoptr i64 %t1698 to ptr
  call void @intrinsic_println(ptr %t1699)
  %t1700 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.145)
  %t1701 = ptrtoint ptr %t1700 to i64
  %t1702 = inttoptr i64 %t1701 to ptr
  call void @intrinsic_println(ptr %t1702)
  %t1703 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.146)
  store i64 %t1703, ptr %local.amp_track.1445
  %t1704 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.147)
  store i64 %t1704, ptr %local.pi.1446
  %t1705 = load i64, ptr %local.amp_track.1445
  %t1706 = load i64, ptr %local.pi.1446
  %t1707 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.148)
  %t1708 = call i64 @"sx_f64_mul"(i64 %t1706, i64 %t1707)
  %t1709 = call i64 @"sin_f64"(i64 %t1708)
  %t1710 = call i64 @"sx_f64_mul"(i64 %t1705, i64 %t1709)
  store i64 %t1710, ptr %local.u6.1447
  %t1711 = load i64, ptr %local.amp_track.1445
  %t1712 = load i64, ptr %local.pi.1446
  %t1713 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.149)
  %t1714 = call i64 @"sx_f64_mul"(i64 %t1712, i64 %t1713)
  %t1715 = call i64 @"sin_f64"(i64 %t1714)
  %t1716 = call i64 @"sx_f64_mul"(i64 %t1711, i64 %t1715)
  store i64 %t1716, ptr %local.v6.1448
  %t1717 = load i64, ptr %local.amp_track.1445
  %t1718 = load i64, ptr %local.pi.1446
  %t1719 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.150)
  %t1720 = call i64 @"sx_f64_mul"(i64 %t1718, i64 %t1719)
  %t1721 = call i64 @"sin_f64"(i64 %t1720)
  %t1722 = call i64 @"sx_f64_mul"(i64 %t1717, i64 %t1721)
  store i64 %t1722, ptr %local.w6.1449
  %t1723 = load i64, ptr %local.amp_track.1445
  %t1724 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.151)
  %t1725 = call i64 @"sx_f64_mul"(i64 %t1723, i64 %t1724)
  %t1726 = load i64, ptr %local.pi.1446
  %t1727 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.152)
  %t1728 = call i64 @"sx_f64_mul"(i64 %t1726, i64 %t1727)
  %t1729 = call i64 @"sin_f64"(i64 %t1728)
  %t1730 = call i64 @"sx_f64_mul"(i64 %t1725, i64 %t1729)
  store i64 %t1730, ptr %local.ox6.1450
  %t1731 = load i64, ptr %local.amp_track.1445
  %t1732 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.153)
  %t1733 = call i64 @"sx_f64_mul"(i64 %t1731, i64 %t1732)
  %t1734 = load i64, ptr %local.pi.1446
  %t1735 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.154)
  %t1736 = call i64 @"sx_f64_mul"(i64 %t1734, i64 %t1735)
  %t1737 = call i64 @"sin_f64"(i64 %t1736)
  %t1738 = call i64 @"sx_f64_mul"(i64 %t1733, i64 %t1737)
  store i64 %t1738, ptr %local.oy6.1451
  %t1739 = load i64, ptr %local.amp_track.1445
  %t1740 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.155)
  %t1741 = call i64 @"sx_f64_mul"(i64 %t1739, i64 %t1740)
  %t1742 = load i64, ptr %local.pi.1446
  %t1743 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.156)
  %t1744 = call i64 @"sx_f64_mul"(i64 %t1742, i64 %t1743)
  %t1745 = call i64 @"sin_f64"(i64 %t1744)
  %t1746 = call i64 @"sx_f64_mul"(i64 %t1741, i64 %t1745)
  store i64 %t1746, ptr %local.oz6.1452
  %t1747 = load i64, ptr %local.amp_track.1445
  %t1748 = load i64, ptr %local.pi.1446
  %t1749 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.157)
  %t1750 = call i64 @"sx_f64_mul"(i64 %t1748, i64 %t1749)
  %t1751 = call i64 @"sin_f64"(i64 %t1750)
  %t1752 = call i64 @"sx_f64_mul"(i64 %t1747, i64 %t1751)
  store i64 %t1752, ptr %local.u8.1453
  %t1753 = load i64, ptr %local.amp_track.1445
  %t1754 = load i64, ptr %local.pi.1446
  %t1755 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.158)
  %t1756 = call i64 @"sx_f64_mul"(i64 %t1754, i64 %t1755)
  %t1757 = call i64 @"sin_f64"(i64 %t1756)
  %t1758 = call i64 @"sx_f64_mul"(i64 %t1753, i64 %t1757)
  store i64 %t1758, ptr %local.v8.1454
  %t1759 = load i64, ptr %local.amp_track.1445
  %t1760 = load i64, ptr %local.pi.1446
  %t1761 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.159)
  %t1762 = call i64 @"sx_f64_mul"(i64 %t1760, i64 %t1761)
  %t1763 = call i64 @"sin_f64"(i64 %t1762)
  %t1764 = call i64 @"sx_f64_mul"(i64 %t1759, i64 %t1763)
  store i64 %t1764, ptr %local.w8.1455
  %t1765 = load i64, ptr %local.amp_track.1445
  %t1766 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.160)
  %t1767 = call i64 @"sx_f64_mul"(i64 %t1765, i64 %t1766)
  %t1768 = load i64, ptr %local.pi.1446
  %t1769 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.161)
  %t1770 = call i64 @"sx_f64_mul"(i64 %t1768, i64 %t1769)
  %t1771 = call i64 @"sin_f64"(i64 %t1770)
  %t1772 = call i64 @"sx_f64_mul"(i64 %t1767, i64 %t1771)
  store i64 %t1772, ptr %local.ox8.1456
  %t1773 = load i64, ptr %local.amp_track.1445
  %t1774 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.162)
  %t1775 = call i64 @"sx_f64_mul"(i64 %t1773, i64 %t1774)
  %t1776 = load i64, ptr %local.pi.1446
  %t1777 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.163)
  %t1778 = call i64 @"sx_f64_mul"(i64 %t1776, i64 %t1777)
  %t1779 = call i64 @"sin_f64"(i64 %t1778)
  %t1780 = call i64 @"sx_f64_mul"(i64 %t1775, i64 %t1779)
  store i64 %t1780, ptr %local.oy8.1457
  %t1781 = load i64, ptr %local.amp_track.1445
  %t1782 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.164)
  %t1783 = call i64 @"sx_f64_mul"(i64 %t1781, i64 %t1782)
  %t1784 = load i64, ptr %local.pi.1446
  %t1785 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.165)
  %t1786 = call i64 @"sx_f64_mul"(i64 %t1784, i64 %t1785)
  %t1787 = call i64 @"sin_f64"(i64 %t1786)
  %t1788 = call i64 @"sx_f64_mul"(i64 %t1783, i64 %t1787)
  store i64 %t1788, ptr %local.oz8.1458
  %t1789 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.166)
  store i64 %t1789, ptr %local.ox28.1459
  %t1790 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.167)
  store i64 %t1790, ptr %local.oy28.1460
  store i64 0, ptr %local.s.1461
  %t1791 = call i64 @f64_parse(ptr @.str.exp_ns_cauchy_convergence.168)
  store i64 %t1791, ptr %local.prev_diff.1462
  br label %loop47
loop47:
  %t1792 = load i64, ptr %local.s.1461
  %t1793 = load i64, ptr %local.max_steps.1436
  %t1794 = icmp slt i64 %t1792, %t1793
  %t1795 = zext i1 %t1794 to i64
  %t1796 = icmp ne i64 %t1795, 0
  br i1 %t1796, label %body47, label %endloop47
body47:
  %t1797 = load i64, ptr %local.s.1461
  %t1798 = srem i64 %t1797, 5000
  %t1799 = icmp eq i64 %t1798, 0
  %t1800 = zext i1 %t1799 to i64
  %t1801 = icmp ne i64 %t1800, 0
  br i1 %t1801, label %then48, label %else48
then48:
  %t1802 = load i64, ptr %local.u8.1453
  %t1803 = load i64, ptr %local.u6.1447
  %t1804 = call i64 @"sx_f64_sub"(i64 %t1802, i64 %t1803)
  store i64 %t1804, ptr %local.du.1463
  %t1805 = load i64, ptr %local.v8.1454
  %t1806 = load i64, ptr %local.v6.1448
  %t1807 = call i64 @"sx_f64_sub"(i64 %t1805, i64 %t1806)
  store i64 %t1807, ptr %local.dv.1464
  %t1808 = load i64, ptr %local.w8.1455
  %t1809 = load i64, ptr %local.w6.1449
  %t1810 = call i64 @"sx_f64_sub"(i64 %t1808, i64 %t1809)
  store i64 %t1810, ptr %local.dw.1465
  %t1811 = load i64, ptr %local.ox8.1456
  %t1812 = load i64, ptr %local.ox6.1450
  %t1813 = call i64 @"sx_f64_sub"(i64 %t1811, i64 %t1812)
  store i64 %t1813, ptr %local.dox.1466
  %t1814 = load i64, ptr %local.oy8.1457
  %t1815 = load i64, ptr %local.oy6.1451
  %t1816 = call i64 @"sx_f64_sub"(i64 %t1814, i64 %t1815)
  store i64 %t1816, ptr %local.doy.1467
  %t1817 = load i64, ptr %local.oz8.1458
  %t1818 = load i64, ptr %local.oz6.1452
  %t1819 = call i64 @"sx_f64_sub"(i64 %t1817, i64 %t1818)
  store i64 %t1819, ptr %local.doz.1468
  %t1820 = load i64, ptr %local.du.1463
  %t1821 = load i64, ptr %local.du.1463
  %t1822 = call i64 @"sx_f64_mul"(i64 %t1820, i64 %t1821)
  %t1823 = load i64, ptr %local.dv.1464
  %t1824 = load i64, ptr %local.dv.1464
  %t1825 = call i64 @"sx_f64_mul"(i64 %t1823, i64 %t1824)
  %t1826 = call i64 @"sx_f64_add"(i64 %t1822, i64 %t1825)
  %t1827 = load i64, ptr %local.dw.1465
  %t1828 = load i64, ptr %local.dw.1465
  %t1829 = call i64 @"sx_f64_mul"(i64 %t1827, i64 %t1828)
  %t1830 = call i64 @"sx_f64_add"(i64 %t1826, i64 %t1829)
  %t1831 = load i64, ptr %local.dox.1466
  %t1832 = load i64, ptr %local.dox.1466
  %t1833 = call i64 @"sx_f64_mul"(i64 %t1831, i64 %t1832)
  %t1834 = call i64 @"sx_f64_add"(i64 %t1830, i64 %t1833)
  %t1835 = load i64, ptr %local.doy.1467
  %t1836 = load i64, ptr %local.doy.1467
  %t1837 = call i64 @"sx_f64_mul"(i64 %t1835, i64 %t1836)
  %t1838 = call i64 @"sx_f64_add"(i64 %t1834, i64 %t1837)
  %t1839 = load i64, ptr %local.doz.1468
  %t1840 = load i64, ptr %local.doz.1468
  %t1841 = call i64 @"sx_f64_mul"(i64 %t1839, i64 %t1840)
  %t1842 = call i64 @"sx_f64_add"(i64 %t1838, i64 %t1841)
  %t1843 = call i64 @"my_sqrt"(i64 %t1842)
  store i64 %t1843, ptr %local.diff.1469
  %t1844 = load i64, ptr %local.s.1461
  %t1845 = call i64 @"sx_int_to_f64"(i64 %t1844)
  %t1846 = load i64, ptr %local.dt.1435
  %t1847 = call i64 @"sx_f64_mul"(i64 %t1845, i64 %t1846)
  store i64 %t1847, ptr %local.time.1470
  %t1848 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.169)
  %t1849 = ptrtoint ptr %t1848 to i64
  %t1850 = inttoptr i64 %t1849 to ptr
  call void @intrinsic_print(ptr %t1850)
  %t1851 = load i64, ptr %local.time.1470
  %t1852 = call i64 @"print_f64"(i64 %t1851)
  %t1853 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.170)
  %t1854 = ptrtoint ptr %t1853 to i64
  %t1855 = inttoptr i64 %t1854 to ptr
  call void @intrinsic_print(ptr %t1855)
  %t1856 = load i64, ptr %local.diff.1469
  %t1857 = call i64 @"print_f64"(i64 %t1856)
  %t1858 = load i64, ptr %local.s.1461
  %t1859 = icmp eq i64 %t1858, 0
  %t1860 = zext i1 %t1859 to i64
  %t1861 = icmp ne i64 %t1860, 0
  br i1 %t1861, label %then49, label %else49
then49:
  %t1862 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.171)
  %t1863 = ptrtoint ptr %t1862 to i64
  %t1864 = inttoptr i64 %t1863 to ptr
  call void @intrinsic_println(ptr %t1864)
  br label %then49_end
then49_end:
  br label %endif49
else49:
  %t1865 = load i64, ptr %local.diff.1469
  %t1866 = load i64, ptr %local.prev_diff.1462
  %t1867 = call i64 @"sx_f64_lt"(i64 %t1865, i64 %t1866)
  %t1868 = icmp ne i64 %t1867, 0
  br i1 %t1868, label %then50, label %else50
then50:
  %t1869 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.172)
  %t1870 = ptrtoint ptr %t1869 to i64
  %t1871 = inttoptr i64 %t1870 to ptr
  call void @intrinsic_println(ptr %t1871)
  br label %then50_end
then50_end:
  br label %endif50
else50:
  %t1872 = load i64, ptr %local.diff.1469
  %t1873 = load i64, ptr %local.prev_diff.1462
  %t1874 = call i64 @"sx_f64_gt"(i64 %t1872, i64 %t1873)
  %t1875 = icmp ne i64 %t1874, 0
  br i1 %t1875, label %then51, label %else51
then51:
  %t1876 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.173)
  %t1877 = ptrtoint ptr %t1876 to i64
  %t1878 = inttoptr i64 %t1877 to ptr
  call void @intrinsic_println(ptr %t1878)
  br label %then51_end
then51_end:
  br label %endif51
else51:
  %t1879 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.174)
  %t1880 = ptrtoint ptr %t1879 to i64
  %t1881 = inttoptr i64 %t1880 to ptr
  call void @intrinsic_println(ptr %t1881)
  br label %else51_end
else51_end:
  br label %endif51
endif51:
  %t1882 = phi i64 [ 0, %then51_end ], [ 0, %else51_end ]
  br label %else50_end
else50_end:
  br label %endif50
endif50:
  %t1883 = phi i64 [ 0, %then50_end ], [ %t1882, %else50_end ]
  br label %else49_end
else49_end:
  br label %endif49
endif49:
  %t1884 = phi i64 [ 0, %then49_end ], [ %t1883, %else49_end ]
  %t1885 = load i64, ptr %local.diff.1469
  store i64 %t1885, ptr %local.prev_diff.1462
  br label %then48_end
then48_end:
  br label %endif48
else48:
  br label %else48_end
else48_end:
  br label %endif48
endif48:
  %t1886 = phi i64 [ 0, %then48_end ], [ 0, %else48_end ]
  %t1887 = load i64, ptr %local.u6.1447
  %t1888 = load i64, ptr %local.v6.1448
  %t1889 = load i64, ptr %local.w6.1449
  %t1890 = load i64, ptr %local.ox6.1450
  %t1891 = load i64, ptr %local.oy6.1451
  %t1892 = load i64, ptr %local.oz6.1452
  %t1893 = load i64, ptr %local.nu.1431
  %t1894 = load i64, ptr %local.sigma.1432
  %t1895 = load i64, ptr %local.lambda.1433
  %t1896 = load i64, ptr %local.lambda2.1434
  %t1897 = load i64, ptr %local.dt.1435
  %t1898 = call i64 @"step6"(i64 %t1887, i64 %t1888, i64 %t1889, i64 %t1890, i64 %t1891, i64 %t1892, i64 %t1893, i64 %t1894, i64 %t1895, i64 %t1896, i64 %t1897, i64 0)
  store i64 %t1898, ptr %local.a0.1471
  %t1899 = load i64, ptr %local.u6.1447
  %t1900 = load i64, ptr %local.v6.1448
  %t1901 = load i64, ptr %local.w6.1449
  %t1902 = load i64, ptr %local.ox6.1450
  %t1903 = load i64, ptr %local.oy6.1451
  %t1904 = load i64, ptr %local.oz6.1452
  %t1905 = load i64, ptr %local.nu.1431
  %t1906 = load i64, ptr %local.sigma.1432
  %t1907 = load i64, ptr %local.lambda.1433
  %t1908 = load i64, ptr %local.lambda2.1434
  %t1909 = load i64, ptr %local.dt.1435
  %t1910 = call i64 @"step6"(i64 %t1899, i64 %t1900, i64 %t1901, i64 %t1902, i64 %t1903, i64 %t1904, i64 %t1905, i64 %t1906, i64 %t1907, i64 %t1908, i64 %t1909, i64 1)
  store i64 %t1910, ptr %local.a1.1472
  %t1911 = load i64, ptr %local.u6.1447
  %t1912 = load i64, ptr %local.v6.1448
  %t1913 = load i64, ptr %local.w6.1449
  %t1914 = load i64, ptr %local.ox6.1450
  %t1915 = load i64, ptr %local.oy6.1451
  %t1916 = load i64, ptr %local.oz6.1452
  %t1917 = load i64, ptr %local.nu.1431
  %t1918 = load i64, ptr %local.sigma.1432
  %t1919 = load i64, ptr %local.lambda.1433
  %t1920 = load i64, ptr %local.lambda2.1434
  %t1921 = load i64, ptr %local.dt.1435
  %t1922 = call i64 @"step6"(i64 %t1911, i64 %t1912, i64 %t1913, i64 %t1914, i64 %t1915, i64 %t1916, i64 %t1917, i64 %t1918, i64 %t1919, i64 %t1920, i64 %t1921, i64 2)
  store i64 %t1922, ptr %local.a2.1473
  %t1923 = load i64, ptr %local.u6.1447
  %t1924 = load i64, ptr %local.v6.1448
  %t1925 = load i64, ptr %local.w6.1449
  %t1926 = load i64, ptr %local.ox6.1450
  %t1927 = load i64, ptr %local.oy6.1451
  %t1928 = load i64, ptr %local.oz6.1452
  %t1929 = load i64, ptr %local.nu.1431
  %t1930 = load i64, ptr %local.sigma.1432
  %t1931 = load i64, ptr %local.lambda.1433
  %t1932 = load i64, ptr %local.lambda2.1434
  %t1933 = load i64, ptr %local.dt.1435
  %t1934 = call i64 @"step6"(i64 %t1923, i64 %t1924, i64 %t1925, i64 %t1926, i64 %t1927, i64 %t1928, i64 %t1929, i64 %t1930, i64 %t1931, i64 %t1932, i64 %t1933, i64 3)
  store i64 %t1934, ptr %local.a3.1474
  %t1935 = load i64, ptr %local.u6.1447
  %t1936 = load i64, ptr %local.v6.1448
  %t1937 = load i64, ptr %local.w6.1449
  %t1938 = load i64, ptr %local.ox6.1450
  %t1939 = load i64, ptr %local.oy6.1451
  %t1940 = load i64, ptr %local.oz6.1452
  %t1941 = load i64, ptr %local.nu.1431
  %t1942 = load i64, ptr %local.sigma.1432
  %t1943 = load i64, ptr %local.lambda.1433
  %t1944 = load i64, ptr %local.lambda2.1434
  %t1945 = load i64, ptr %local.dt.1435
  %t1946 = call i64 @"step6"(i64 %t1935, i64 %t1936, i64 %t1937, i64 %t1938, i64 %t1939, i64 %t1940, i64 %t1941, i64 %t1942, i64 %t1943, i64 %t1944, i64 %t1945, i64 4)
  store i64 %t1946, ptr %local.a4.1475
  %t1947 = load i64, ptr %local.u6.1447
  %t1948 = load i64, ptr %local.v6.1448
  %t1949 = load i64, ptr %local.w6.1449
  %t1950 = load i64, ptr %local.ox6.1450
  %t1951 = load i64, ptr %local.oy6.1451
  %t1952 = load i64, ptr %local.oz6.1452
  %t1953 = load i64, ptr %local.nu.1431
  %t1954 = load i64, ptr %local.sigma.1432
  %t1955 = load i64, ptr %local.lambda.1433
  %t1956 = load i64, ptr %local.lambda2.1434
  %t1957 = load i64, ptr %local.dt.1435
  %t1958 = call i64 @"step6"(i64 %t1947, i64 %t1948, i64 %t1949, i64 %t1950, i64 %t1951, i64 %t1952, i64 %t1953, i64 %t1954, i64 %t1955, i64 %t1956, i64 %t1957, i64 5)
  store i64 %t1958, ptr %local.a5.1476
  %t1959 = load i64, ptr %local.a0.1471
  store i64 %t1959, ptr %local.u6.1447
  %t1960 = load i64, ptr %local.a1.1472
  store i64 %t1960, ptr %local.v6.1448
  %t1961 = load i64, ptr %local.a2.1473
  store i64 %t1961, ptr %local.w6.1449
  %t1962 = load i64, ptr %local.a3.1474
  store i64 %t1962, ptr %local.ox6.1450
  %t1963 = load i64, ptr %local.a4.1475
  store i64 %t1963, ptr %local.oy6.1451
  %t1964 = load i64, ptr %local.a5.1476
  store i64 %t1964, ptr %local.oz6.1452
  %t1965 = load i64, ptr %local.u8.1453
  %t1966 = load i64, ptr %local.v8.1454
  %t1967 = load i64, ptr %local.w8.1455
  %t1968 = load i64, ptr %local.ox8.1456
  %t1969 = load i64, ptr %local.oy8.1457
  %t1970 = load i64, ptr %local.oz8.1458
  %t1971 = load i64, ptr %local.ox28.1459
  %t1972 = load i64, ptr %local.oy28.1460
  %t1973 = load i64, ptr %local.nu.1431
  %t1974 = load i64, ptr %local.sigma.1432
  %t1975 = load i64, ptr %local.lambda.1433
  %t1976 = load i64, ptr %local.lambda2.1434
  %t1977 = load i64, ptr %local.dt.1435
  %t1978 = call i64 @"step8"(i64 %t1965, i64 %t1966, i64 %t1967, i64 %t1968, i64 %t1969, i64 %t1970, i64 %t1971, i64 %t1972, i64 %t1973, i64 %t1974, i64 %t1975, i64 %t1976, i64 %t1977, i64 0)
  store i64 %t1978, ptr %local.b0.1477
  %t1979 = load i64, ptr %local.u8.1453
  %t1980 = load i64, ptr %local.v8.1454
  %t1981 = load i64, ptr %local.w8.1455
  %t1982 = load i64, ptr %local.ox8.1456
  %t1983 = load i64, ptr %local.oy8.1457
  %t1984 = load i64, ptr %local.oz8.1458
  %t1985 = load i64, ptr %local.ox28.1459
  %t1986 = load i64, ptr %local.oy28.1460
  %t1987 = load i64, ptr %local.nu.1431
  %t1988 = load i64, ptr %local.sigma.1432
  %t1989 = load i64, ptr %local.lambda.1433
  %t1990 = load i64, ptr %local.lambda2.1434
  %t1991 = load i64, ptr %local.dt.1435
  %t1992 = call i64 @"step8"(i64 %t1979, i64 %t1980, i64 %t1981, i64 %t1982, i64 %t1983, i64 %t1984, i64 %t1985, i64 %t1986, i64 %t1987, i64 %t1988, i64 %t1989, i64 %t1990, i64 %t1991, i64 1)
  store i64 %t1992, ptr %local.b1.1478
  %t1993 = load i64, ptr %local.u8.1453
  %t1994 = load i64, ptr %local.v8.1454
  %t1995 = load i64, ptr %local.w8.1455
  %t1996 = load i64, ptr %local.ox8.1456
  %t1997 = load i64, ptr %local.oy8.1457
  %t1998 = load i64, ptr %local.oz8.1458
  %t1999 = load i64, ptr %local.ox28.1459
  %t2000 = load i64, ptr %local.oy28.1460
  %t2001 = load i64, ptr %local.nu.1431
  %t2002 = load i64, ptr %local.sigma.1432
  %t2003 = load i64, ptr %local.lambda.1433
  %t2004 = load i64, ptr %local.lambda2.1434
  %t2005 = load i64, ptr %local.dt.1435
  %t2006 = call i64 @"step8"(i64 %t1993, i64 %t1994, i64 %t1995, i64 %t1996, i64 %t1997, i64 %t1998, i64 %t1999, i64 %t2000, i64 %t2001, i64 %t2002, i64 %t2003, i64 %t2004, i64 %t2005, i64 2)
  store i64 %t2006, ptr %local.b2.1479
  %t2007 = load i64, ptr %local.u8.1453
  %t2008 = load i64, ptr %local.v8.1454
  %t2009 = load i64, ptr %local.w8.1455
  %t2010 = load i64, ptr %local.ox8.1456
  %t2011 = load i64, ptr %local.oy8.1457
  %t2012 = load i64, ptr %local.oz8.1458
  %t2013 = load i64, ptr %local.ox28.1459
  %t2014 = load i64, ptr %local.oy28.1460
  %t2015 = load i64, ptr %local.nu.1431
  %t2016 = load i64, ptr %local.sigma.1432
  %t2017 = load i64, ptr %local.lambda.1433
  %t2018 = load i64, ptr %local.lambda2.1434
  %t2019 = load i64, ptr %local.dt.1435
  %t2020 = call i64 @"step8"(i64 %t2007, i64 %t2008, i64 %t2009, i64 %t2010, i64 %t2011, i64 %t2012, i64 %t2013, i64 %t2014, i64 %t2015, i64 %t2016, i64 %t2017, i64 %t2018, i64 %t2019, i64 3)
  store i64 %t2020, ptr %local.b3.1480
  %t2021 = load i64, ptr %local.u8.1453
  %t2022 = load i64, ptr %local.v8.1454
  %t2023 = load i64, ptr %local.w8.1455
  %t2024 = load i64, ptr %local.ox8.1456
  %t2025 = load i64, ptr %local.oy8.1457
  %t2026 = load i64, ptr %local.oz8.1458
  %t2027 = load i64, ptr %local.ox28.1459
  %t2028 = load i64, ptr %local.oy28.1460
  %t2029 = load i64, ptr %local.nu.1431
  %t2030 = load i64, ptr %local.sigma.1432
  %t2031 = load i64, ptr %local.lambda.1433
  %t2032 = load i64, ptr %local.lambda2.1434
  %t2033 = load i64, ptr %local.dt.1435
  %t2034 = call i64 @"step8"(i64 %t2021, i64 %t2022, i64 %t2023, i64 %t2024, i64 %t2025, i64 %t2026, i64 %t2027, i64 %t2028, i64 %t2029, i64 %t2030, i64 %t2031, i64 %t2032, i64 %t2033, i64 4)
  store i64 %t2034, ptr %local.b4.1481
  %t2035 = load i64, ptr %local.u8.1453
  %t2036 = load i64, ptr %local.v8.1454
  %t2037 = load i64, ptr %local.w8.1455
  %t2038 = load i64, ptr %local.ox8.1456
  %t2039 = load i64, ptr %local.oy8.1457
  %t2040 = load i64, ptr %local.oz8.1458
  %t2041 = load i64, ptr %local.ox28.1459
  %t2042 = load i64, ptr %local.oy28.1460
  %t2043 = load i64, ptr %local.nu.1431
  %t2044 = load i64, ptr %local.sigma.1432
  %t2045 = load i64, ptr %local.lambda.1433
  %t2046 = load i64, ptr %local.lambda2.1434
  %t2047 = load i64, ptr %local.dt.1435
  %t2048 = call i64 @"step8"(i64 %t2035, i64 %t2036, i64 %t2037, i64 %t2038, i64 %t2039, i64 %t2040, i64 %t2041, i64 %t2042, i64 %t2043, i64 %t2044, i64 %t2045, i64 %t2046, i64 %t2047, i64 5)
  store i64 %t2048, ptr %local.b5.1482
  %t2049 = load i64, ptr %local.u8.1453
  %t2050 = load i64, ptr %local.v8.1454
  %t2051 = load i64, ptr %local.w8.1455
  %t2052 = load i64, ptr %local.ox8.1456
  %t2053 = load i64, ptr %local.oy8.1457
  %t2054 = load i64, ptr %local.oz8.1458
  %t2055 = load i64, ptr %local.ox28.1459
  %t2056 = load i64, ptr %local.oy28.1460
  %t2057 = load i64, ptr %local.nu.1431
  %t2058 = load i64, ptr %local.sigma.1432
  %t2059 = load i64, ptr %local.lambda.1433
  %t2060 = load i64, ptr %local.lambda2.1434
  %t2061 = load i64, ptr %local.dt.1435
  %t2062 = call i64 @"step8"(i64 %t2049, i64 %t2050, i64 %t2051, i64 %t2052, i64 %t2053, i64 %t2054, i64 %t2055, i64 %t2056, i64 %t2057, i64 %t2058, i64 %t2059, i64 %t2060, i64 %t2061, i64 6)
  store i64 %t2062, ptr %local.b6.1483
  %t2063 = load i64, ptr %local.u8.1453
  %t2064 = load i64, ptr %local.v8.1454
  %t2065 = load i64, ptr %local.w8.1455
  %t2066 = load i64, ptr %local.ox8.1456
  %t2067 = load i64, ptr %local.oy8.1457
  %t2068 = load i64, ptr %local.oz8.1458
  %t2069 = load i64, ptr %local.ox28.1459
  %t2070 = load i64, ptr %local.oy28.1460
  %t2071 = load i64, ptr %local.nu.1431
  %t2072 = load i64, ptr %local.sigma.1432
  %t2073 = load i64, ptr %local.lambda.1433
  %t2074 = load i64, ptr %local.lambda2.1434
  %t2075 = load i64, ptr %local.dt.1435
  %t2076 = call i64 @"step8"(i64 %t2063, i64 %t2064, i64 %t2065, i64 %t2066, i64 %t2067, i64 %t2068, i64 %t2069, i64 %t2070, i64 %t2071, i64 %t2072, i64 %t2073, i64 %t2074, i64 %t2075, i64 7)
  store i64 %t2076, ptr %local.b7.1484
  %t2077 = load i64, ptr %local.b0.1477
  store i64 %t2077, ptr %local.u8.1453
  %t2078 = load i64, ptr %local.b1.1478
  store i64 %t2078, ptr %local.v8.1454
  %t2079 = load i64, ptr %local.b2.1479
  store i64 %t2079, ptr %local.w8.1455
  %t2080 = load i64, ptr %local.b3.1480
  store i64 %t2080, ptr %local.ox8.1456
  %t2081 = load i64, ptr %local.b4.1481
  store i64 %t2081, ptr %local.oy8.1457
  %t2082 = load i64, ptr %local.b5.1482
  store i64 %t2082, ptr %local.oz8.1458
  %t2083 = load i64, ptr %local.b6.1483
  store i64 %t2083, ptr %local.ox28.1459
  %t2084 = load i64, ptr %local.b7.1484
  store i64 %t2084, ptr %local.oy28.1460
  %t2085 = load i64, ptr %local.s.1461
  %t2086 = add i64 %t2085, 1
  store i64 %t2086, ptr %local.s.1461
  br label %loop47
endloop47:
  %t2087 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.175)
  %t2088 = ptrtoint ptr %t2087 to i64
  %t2089 = inttoptr i64 %t2088 to ptr
  call void @intrinsic_println(ptr %t2089)
  %t2090 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.176)
  %t2091 = ptrtoint ptr %t2090 to i64
  %t2092 = inttoptr i64 %t2091 to ptr
  call void @intrinsic_println(ptr %t2092)
  %t2093 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.177)
  %t2094 = ptrtoint ptr %t2093 to i64
  %t2095 = inttoptr i64 %t2094 to ptr
  call void @intrinsic_println(ptr %t2095)
  %t2096 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.178)
  %t2097 = ptrtoint ptr %t2096 to i64
  %t2098 = inttoptr i64 %t2097 to ptr
  call void @intrinsic_println(ptr %t2098)
  %t2099 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.179)
  %t2100 = ptrtoint ptr %t2099 to i64
  %t2101 = inttoptr i64 %t2100 to ptr
  call void @intrinsic_println(ptr %t2101)
  %t2102 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.180)
  %t2103 = ptrtoint ptr %t2102 to i64
  %t2104 = inttoptr i64 %t2103 to ptr
  call void @intrinsic_println(ptr %t2104)
  %t2105 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.181)
  %t2106 = ptrtoint ptr %t2105 to i64
  %t2107 = inttoptr i64 %t2106 to ptr
  call void @intrinsic_println(ptr %t2107)
  %t2108 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.182)
  %t2109 = ptrtoint ptr %t2108 to i64
  %t2110 = inttoptr i64 %t2109 to ptr
  call void @intrinsic_println(ptr %t2110)
  %t2111 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.183)
  %t2112 = ptrtoint ptr %t2111 to i64
  %t2113 = inttoptr i64 %t2112 to ptr
  call void @intrinsic_println(ptr %t2113)
  %t2114 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.184)
  %t2115 = ptrtoint ptr %t2114 to i64
  %t2116 = inttoptr i64 %t2115 to ptr
  call void @intrinsic_println(ptr %t2116)
  %t2117 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.185)
  %t2118 = ptrtoint ptr %t2117 to i64
  %t2119 = inttoptr i64 %t2118 to ptr
  call void @intrinsic_println(ptr %t2119)
  %t2120 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.186)
  %t2121 = ptrtoint ptr %t2120 to i64
  %t2122 = inttoptr i64 %t2121 to ptr
  call void @intrinsic_println(ptr %t2122)
  %t2123 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.187)
  %t2124 = ptrtoint ptr %t2123 to i64
  %t2125 = inttoptr i64 %t2124 to ptr
  call void @intrinsic_println(ptr %t2125)
  %t2126 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.188)
  %t2127 = ptrtoint ptr %t2126 to i64
  %t2128 = inttoptr i64 %t2127 to ptr
  call void @intrinsic_println(ptr %t2128)
  %t2129 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.189)
  %t2130 = ptrtoint ptr %t2129 to i64
  %t2131 = inttoptr i64 %t2130 to ptr
  call void @intrinsic_println(ptr %t2131)
  %t2132 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.190)
  %t2133 = ptrtoint ptr %t2132 to i64
  %t2134 = inttoptr i64 %t2133 to ptr
  call void @intrinsic_println(ptr %t2134)
  %t2135 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.191)
  %t2136 = ptrtoint ptr %t2135 to i64
  %t2137 = inttoptr i64 %t2136 to ptr
  call void @intrinsic_println(ptr %t2137)
  %t2138 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.192)
  %t2139 = ptrtoint ptr %t2138 to i64
  %t2140 = inttoptr i64 %t2139 to ptr
  call void @intrinsic_println(ptr %t2140)
  %t2141 = call ptr @intrinsic_string_new(ptr @.str.exp_ns_cauchy_convergence.193)
  %t2142 = ptrtoint ptr %t2141 to i64
  %t2143 = inttoptr i64 %t2142 to ptr
  call void @intrinsic_println(ptr %t2143)
  ret i64 0
}


; String constants
@.str.exp_ns_cauchy_convergence.0 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.1 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.2 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.3 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.4 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.5 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.6 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.7 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_cauchy_convergence.8 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.9 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_cauchy_convergence.10 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.11 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_cauchy_convergence.12 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.13 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_cauchy_convergence.14 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.15 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_cauchy_convergence.16 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.17 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_cauchy_convergence.18 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.19 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_cauchy_convergence.20 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.21 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_cauchy_convergence.22 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.23 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_cauchy_convergence.24 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.25 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_cauchy_convergence.26 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.27 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_cauchy_convergence.28 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.29 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_cauchy_convergence.30 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.31 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_cauchy_convergence.32 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.33 = private unnamed_addr constant [4 x i8] c"9.0\00"
@.str.exp_ns_cauchy_convergence.34 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.35 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.36 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.37 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.38 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.39 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_cauchy_convergence.40 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_cauchy_convergence.41 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.42 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_cauchy_convergence.43 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.44 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.45 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.46 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_cauchy_convergence.47 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.48 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_cauchy_convergence.49 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_cauchy_convergence.50 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_cauchy_convergence.51 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.52 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_cauchy_convergence.53 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.54 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.55 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.56 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_cauchy_convergence.57 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.58 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_cauchy_convergence.59 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.60 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.61 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.62 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_cauchy_convergence.63 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_cauchy_convergence.64 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_cauchy_convergence.65 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_cauchy_convergence.66 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_cauchy_convergence.67 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.68 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_cauchy_convergence.69 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.70 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.71 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.72 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_cauchy_convergence.73 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.74 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_cauchy_convergence.75 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_ns_cauchy_convergence.76 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_cauchy_convergence.77 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_cauchy_convergence.78 = private unnamed_addr constant [4 x i8] c"4.0\00"
@.str.exp_ns_cauchy_convergence.79 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_cauchy_convergence.80 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_cauchy_convergence.81 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_cauchy_convergence.82 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.83 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_cauchy_convergence.84 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.85 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.86 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.87 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_cauchy_convergence.88 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.89 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_cauchy_convergence.90 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.91 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.92 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.93 = private unnamed_addr constant [8 x i8] c"10000.0\00"
@.str.exp_ns_cauchy_convergence.94 = private unnamed_addr constant [4 x i8] c"2.0\00"
@.str.exp_ns_cauchy_convergence.95 = private unnamed_addr constant [5 x i8] c"0.01\00"
@.str.exp_ns_cauchy_convergence.96 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_cauchy_convergence.97 = private unnamed_addr constant [4 x i8] c"1.0\00"
@.str.exp_ns_cauchy_convergence.98 = private unnamed_addr constant [5 x i8] c"10.0\00"
@.str.exp_ns_cauchy_convergence.99 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_cauchy_convergence.100 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_cauchy_convergence.101 = private unnamed_addr constant [62 x i8] c"#  CAUCHY CONVERGENCE: Does the Galerkin sequence converge? #\00"
@.str.exp_ns_cauchy_convergence.102 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_cauchy_convergence.103 = private unnamed_addr constant [63 x i8] c"#  ||u_{N+2} - u_N||_{L^2} → 0 as N → ∞?               #\00"
@.str.exp_ns_cauchy_convergence.104 = private unnamed_addr constant [61 x i8] c"#                                                          #\00"
@.str.exp_ns_cauchy_convergence.105 = private unnamed_addr constant [63 x i8] c"#  If yes → Galerkin sequence is Cauchy → converges      #\00"
@.str.exp_ns_cauchy_convergence.106 = private unnamed_addr constant [62 x i8] c"#  → limit inherits regularity from finite truncations    #\00"
@.str.exp_ns_cauchy_convergence.107 = private unnamed_addr constant [62 x i8] c"#  → closes the Galerkin approximation gap                #\00"
@.str.exp_ns_cauchy_convergence.108 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_cauchy_convergence.109 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.110 = private unnamed_addr constant [33 x i8] c"  === Phase 1: A* comparison ===\00"
@.str.exp_ns_cauchy_convergence.111 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.112 = private unnamed_addr constant [16 x i8] c"  A*(6-mode) = \00"
@.str.exp_ns_cauchy_convergence.113 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.114 = private unnamed_addr constant [16 x i8] c"  A*(8-mode) = \00"
@.str.exp_ns_cauchy_convergence.115 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.116 = private unnamed_addr constant [16 x i8] c"  Delta A*   = \00"
@.str.exp_ns_cauchy_convergence.117 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.118 = private unnamed_addr constant [49 x i8] c"  (8-mode ≥ 6-mode ✓ — adding modes HELPS)\00"
@.str.exp_ns_cauchy_convergence.119 = private unnamed_addr constant [43 x i8] c"  (8-mode < 6-mode — adding modes HURTS)\00"
@.str.exp_ns_cauchy_convergence.120 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.121 = private unnamed_addr constant [61 x i8] c"  === Phase 2: ||u_8 - u_6||_{L^2} at various amplitudes ===\00"
@.str.exp_ns_cauchy_convergence.122 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.123 = private unnamed_addr constant [50 x i8] c"  A        ||u_8 - u_6||   A/A*     Relative diff\00"
@.str.exp_ns_cauchy_convergence.124 = private unnamed_addr constant [49 x i8] c"  ------   ------------   ------   -------------\00"
@.str.exp_ns_cauchy_convergence.125 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.126 = private unnamed_addr constant [5 x i8] c"0.05\00"
@.str.exp_ns_cauchy_convergence.127 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.128 = private unnamed_addr constant [4 x i8] c"0.2\00"
@.str.exp_ns_cauchy_convergence.129 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_cauchy_convergence.130 = private unnamed_addr constant [4 x i8] c"0.4\00"
@.str.exp_ns_cauchy_convergence.131 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.132 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.133 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_cauchy_convergence.134 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.135 = private unnamed_addr constant [7 x i8] c"0.0001\00"
@.str.exp_ns_cauchy_convergence.136 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_cauchy_convergence.137 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_cauchy_convergence.138 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_cauchy_convergence.139 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_cauchy_convergence.140 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.141 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.142 = private unnamed_addr constant [57 x i8] c"  === Phase 3: ||u_8(t) - u_6(t)|| over time (A=0.3) ===\00"
@.str.exp_ns_cauchy_convergence.143 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.144 = private unnamed_addr constant [32 x i8] c"  Time     ||diff||       Trend\00"
@.str.exp_ns_cauchy_convergence.145 = private unnamed_addr constant [32 x i8] c"  ------   ----------     -----\00"
@.str.exp_ns_cauchy_convergence.146 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_cauchy_convergence.147 = private unnamed_addr constant [17 x i8] c"3.14159265358979\00"
@.str.exp_ns_cauchy_convergence.148 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_cauchy_convergence.149 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.150 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_cauchy_convergence.151 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.152 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.153 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.154 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_cauchy_convergence.155 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.156 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_cauchy_convergence.157 = private unnamed_addr constant [4 x i8] c"0.3\00"
@.str.exp_ns_cauchy_convergence.158 = private unnamed_addr constant [4 x i8] c"0.7\00"
@.str.exp_ns_cauchy_convergence.159 = private unnamed_addr constant [4 x i8] c"1.1\00"
@.str.exp_ns_cauchy_convergence.160 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.161 = private unnamed_addr constant [4 x i8] c"0.5\00"
@.str.exp_ns_cauchy_convergence.162 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.163 = private unnamed_addr constant [4 x i8] c"0.9\00"
@.str.exp_ns_cauchy_convergence.164 = private unnamed_addr constant [4 x i8] c"0.1\00"
@.str.exp_ns_cauchy_convergence.165 = private unnamed_addr constant [4 x i8] c"1.3\00"
@.str.exp_ns_cauchy_convergence.166 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.167 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.168 = private unnamed_addr constant [4 x i8] c"0.0\00"
@.str.exp_ns_cauchy_convergence.169 = private unnamed_addr constant [3 x i8] c"  \00"
@.str.exp_ns_cauchy_convergence.170 = private unnamed_addr constant [4 x i8] c"   \00"
@.str.exp_ns_cauchy_convergence.171 = private unnamed_addr constant [15 x i8] c"     (initial)\00"
@.str.exp_ns_cauchy_convergence.172 = private unnamed_addr constant [19 x i8] c"     SHRINKING ✓\00"
@.str.exp_ns_cauchy_convergence.173 = private unnamed_addr constant [13 x i8] c"     growing\00"
@.str.exp_ns_cauchy_convergence.174 = private unnamed_addr constant [12 x i8] c"     stable\00"
@.str.exp_ns_cauchy_convergence.175 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.176 = private unnamed_addr constant [30 x i8] c"  === Phase 4: Assessment ===\00"
@.str.exp_ns_cauchy_convergence.177 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.178 = private unnamed_addr constant [42 x i8] c"  If ||u_{N+2} - u_N|| shrinks over time:\00"
@.str.exp_ns_cauchy_convergence.179 = private unnamed_addr constant [58 x i8] c"    → The two truncations CONVERGE to the same solution\00"
@.str.exp_ns_cauchy_convergence.180 = private unnamed_addr constant [56 x i8] c"    → Higher modes don't change the low-mode dynamics\00"
@.str.exp_ns_cauchy_convergence.181 = private unnamed_addr constant [40 x i8] c"    → The Galerkin sequence is Cauchy\00"
@.str.exp_ns_cauchy_convergence.182 = private unnamed_addr constant [39 x i8] c"    → It converges to a limit in L^2\00"
@.str.exp_ns_cauchy_convergence.183 = private unnamed_addr constant [52 x i8] c"    → The limit inherits Prodi-Serrin boundedness\00"
@.str.exp_ns_cauchy_convergence.184 = private unnamed_addr constant [51 x i8] c"    → REGULARITY of the limit (full NS solution)\00"
@.str.exp_ns_cauchy_convergence.185 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.186 = private unnamed_addr constant [21 x i8] c"  If A*(8) >= A*(6):\00"
@.str.exp_ns_cauchy_convergence.187 = private unnamed_addr constant [47 x i8] c"    → Adding modes INCREASES the safe region\00"
@.str.exp_ns_cauchy_convergence.188 = private unnamed_addr constant [52 x i8] c"    → Consistent with monotonicity (Experiment 3)\00"
@.str.exp_ns_cauchy_convergence.189 = private unnamed_addr constant [58 x i8] c"    → The full NS solution has A* >= sup A*(N) = A*_inf\00"
@.str.exp_ns_cauchy_convergence.190 = private unnamed_addr constant [1 x i8] c"\00"
@.str.exp_ns_cauchy_convergence.191 = private unnamed_addr constant [61 x i8] c"############################################################\00"
@.str.exp_ns_cauchy_convergence.192 = private unnamed_addr constant [61 x i8] c"#  CAUCHY CONVERGENCE COMPLETE                             #\00"
@.str.exp_ns_cauchy_convergence.193 = private unnamed_addr constant [61 x i8] c"############################################################\00"
